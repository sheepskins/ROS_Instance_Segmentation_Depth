#!/usr/bin/env python3

import rospy
from constants import ANGLE_INC, MIN_ANGLE, WIDTH
from visualization_msgs.msg import Marker
from math import cos, sin
from instance_segmentation_depth.msg import Depth_Result


vis_pub = rospy.Publisher('visualization_marker', Marker, queue_size=1)

objects = []

def process(objects):
    for i in range(len(objects.depths)):
        marker = Marker()

        marker.header.frame_id = "map"
        marker.header.stamp = rospy.Time.now()
        marker.ns = ""

        # Shape
        marker.type = marker.CYLINDER
        marker.id = 0
        marker.action = 0

        # Scale
        marker.scale.x = objects.sizes[i]/1000
        marker.scale.y = objects.sizes[i]/1000
        marker.scale.z = 2

        # Color
        marker.color.r = 0.0
        marker.color.g = 0.0
        marker.color.b = 0.0
        marker.color.a = 1.0

        # Pose
        marker.pose.position.x = objects.depths[i]/1000 * cos(objects.angles[i])
        marker.pose.position.y = objects.depths[i]/1000 * sin(objects.angles[i])
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