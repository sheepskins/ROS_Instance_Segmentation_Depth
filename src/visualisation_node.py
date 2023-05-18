#!/usr/bin/env python3

import rospy
from constants import ANGLE_INC, MIN_ANGLE, WIDTH
from visualization_msgs.msg import Marker
from math import cos, sin, dist, radians        
from instance_segmentation_depth.msg import Depth_Result
from random import randint
from numpy import interp


vis_pub = rospy.Publisher('visualization_marker', Marker, queue_size=1)

def genColour(): 
    r = interp(randint(0,255),[0,255], [0,1])
    g = interp(randint(0,255),[0,255], [0,1])
    b = interp(randint(0,255),[0,255], [0,1])
    return [r,g,b]

class Object: 
    name = []
    x_pos = 0
    y_pos = 0
    prev_x = 0
    prev_y = 0
    colour = []
    id = 0


objects_list = []

def object_checker(objects_list, sample_object):
    for item in objects_list:
        if (item.name == sample_object.name and dist([item.x_pos,item.y_pos], [sample_object.x_pos, sample_object.y_pos]) < 1):
            return item
    sample_object.id = len(objects_list) + 1
    sample_object.colour = genColour()
    objects_list.append(sample_object)
    return objects_list[-1]

    

def process(objects):
    rospy.loginfo(len(objects_list))
    for i in range(len(objects.depths)):
        object = Object()
        object.name = objects.class_names[i]
        object.x_pos = objects.depths[i]/1000 * cos(radians(objects.angles[i]))
        object.y_pos = objects.depths[i]/1000 * sin(radians(objects.angles[i]))

        object = object_checker(objects_list, object)

        marker = Marker()

        marker.id = object.id

        object.x_pos = (object.x_pos + object.prev_x)/2
        object.y_pos = (object.y_pos + object.prev_y)/2
        object.prev_x = object.x_pos 
        object.prev_y = object.y_pos
        
        marker.header.frame_id = "camera_link"
        marker.header.stamp = rospy.Time.now()

        # Shape
        marker.type = marker.CYLINDER
        marker.action = 0

        # Scale
        marker.scale.x = 0.5 #objects.sizes[i]/1000
        marker.scale.y = 0.5 #objects.sizes[i]/1000
        marker.scale.z = 2

        # Color
        marker.color.r = object.colour[0]
        marker.color.g = object.colour[1]
        marker.color.b = object.colour[2]
        marker.color.a = 1.0

        # Pose
        marker.pose.position.x = object.x_pos
        marker.pose.position.y = object.y_pos
        marker.pose.position.z = 0
        marker.pose.orientation.x = 0.0
        marker.pose.orientation.y = 0.0
        marker.pose.orientation.z = 0.0
        marker.pose.orientation.w = 1.0

        marker.lifetime = rospy.Duration(3)
        

        vis_pub.publish(marker)
    


def main():
    rospy.init_node('visualisation_node')
    obj_sub = rospy.Subscriber('object_depth/objects', Depth_Result ,process)
    rate = rospy.Rate(1)
    rospy.spin()

if __name__=='__main__':
    main()