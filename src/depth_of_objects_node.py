#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from instance_segmentation_depth.srv import Detection, DetectionRequest
from instance_segmentation_depth.msg import Result
import numpy as np

box_pub = rospy.Publisher('mask_rcnn_detections', Result, queue_size=1)

def process(image):
    rospy.wait_for_service('mask_rcnn_service')

    try:
        detection_func = rospy.ServiceProxy('mask_rcnn_service', Detection)
        detection_msg = detection_func(image)
        box_pub.publish(detection_msg.detection_result)
        rospy.loginfo("Detection time: %f", (detection_msg.detection_result.header.stamp - image.header.stamp).to_sec())

    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def main():
    im_sub = rospy.Subscriber('/camera/image_raw', Image, callback=process, queue_size=1)
    rospy.init_node('depth_node')
    rate = rospy.Rate(1)
    rospy.spin()

if __name__=='__main__':
    main()