#!/usr/bin/env python3

import rospy
from constants import ANGLE_INC, MIN_ANGLE, WIDTH
import message_filters
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from instance_segmentation_depth.msg import Depth_Result
from instance_segmentation_depth.srv import Detection, DetectionRequest
from instance_segmentation_depth.msg import Result
import numpy as np
from math import sqrt, cos, pow

box_pub = rospy.Publisher('mask_rcnn_detections', Result, queue_size=1)
obj_depth_pub = rospy.Publisher('object_depth/objects', Depth_Result, queue_size=1)

def process(image, depth):
    rospy.wait_for_service('mask_rcnn_service')

    global detections
    bridge = CvBridge()
    depth_image = bridge.imgmsg_to_cv2(img_msg=depth, desired_encoding="passthrough")
    depth_array = np.array(depth_image,dtype=np.float32)
    depth_array = depth_array.flatten()
    

    try:
        detection_func = rospy.ServiceProxy('mask_rcnn_service', Detection)
        detection_msg = detection_func(image)
        detections = detection_msg.detection_result
        # box_pub.publish(detection_msg.detection_result)
        #rospy.loginfo("Detection time: %f \n objects detected: %x", (detections.header.stamp - image.header.stamp).to_sec(), len(detections.masks))

    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    
    objects = Depth_Result()

    
    for obj_index, detection in enumerate(detections.masks):
        deptharray = []
        for index, pixel in enumerate(detection.data):
            if pixel == 1:
                deptharray.append(depth_array[index])
        
        deptharray = np.array(deptharray)
        depth = np.median(deptharray)
        objects.depths.append(depth)

        angle_index = detections.boxes[obj_index].x_offset + detections.boxes[obj_index].width/2

        size_left = detections.boxes[obj_index].x_offset
        size_right = detections.boxes[obj_index].x_offset + detections.boxes[obj_index].width
        size_angle = size_right-size_left * ANGLE_INC
        size = sqrt(pow(depth, 2)(1-cos(size_angle)))
        objects.sizes.append(size)
        
        objects.angles.append(angle_index * ANGLE_INC + MIN_ANGLE)
        objects.class_names.append(detections.class_names[obj_index])

    obj_depth_pub.publish(objects)


def main():
    rospy.init_node('depth_node')
    im_sub = message_filters.Subscriber('/camera/color/image_raw', Image)
    depth_sub = message_filters.Subscriber('/camera/aligned_depth_to_color/image_raw', Image)
    ts = message_filters.ApproximateTimeSynchronizer([im_sub, depth_sub], queue_size=1, slop=0.1)
    ts.registerCallback(process)
    rate = rospy.Rate(1)
    rospy.spin()

if __name__=='__main__':
    main()