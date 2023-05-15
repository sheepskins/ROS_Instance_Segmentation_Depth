#!/usr/bin/env python3

import rospy
from constants import ANGLE_INC, MIN_ANGLE, WIDTH
from visualization_msgs.msg import Marker
from math import cos, sin, dist, radians        
from instance_segmentation_depth.msg import Depth_Result


vis_pub = rospy.Publisher('visualization_marker', Marker, queue_size=1)

class Object: 
    name = []
    x_pos = 0
    y_pos = 0
    id = 0


objects_list = []

def object_checker(objects_list, sample_object):
    for item in objects_list:
        if (item.name == sample_object.name and dist([item.x_pos,item.y_pos], [sample_object.x_pos, sample_object.y_pos]) < 2):
            return item.id
    sample_object.id = len(objects_list) + 1
    objects_list.append(sample_object)
    return sample_object.id

    

def process(objects):
    
    for i in range(len(objects.depths)):
        object = Object()
        object.name = objects.class_names[i]
        object.x_pos = objects.depths[i]/1000 * cos(radians(objects.angles[i]))
        object.y_pos = objects.depths[i]/1000 * sin(radians(objects.angles[i]))


        marker = Marker()

        marker.header.frame_id = "map"
        marker.header.stamp = rospy.Time.now()
        marker.ns = ""

        # Shape
        marker.type = marker.CYLINDER
        marker.id = object_checker(objects_list, object)
        marker.action = 0

        # Scale
        marker.scale.x = 0.5 #objects.sizes[i]/1000
        marker.scale.y = 0.5 #objects.sizes[i]/1000
        marker.scale.z = 2

        # Color
        marker.color.r = 0.0
        marker.color.g = 0.0
        marker.color.b = 0.0
        marker.color.a = 1.0

        # Pose
        marker.pose.position.x = object.x_pos
        marker.pose.position.y = object.y_pos
        marker.pose.position.z = 0
        marker.pose.orientation.x = 0.0
        marker.pose.orientation.y = 0.0
        marker.pose.orientation.z = 0.0
        marker.pose.orientation.w = 1.0
        

        vis_pub.publish(marker)
    


def main():
    rospy.init_node('visualisation_node')
    obj_sub = rospy.Subscriber('object_depth/objects', Depth_Result ,process)
    rate = rospy.Rate(1)
    rospy.spin()

if __name__=='__main__':
    main()