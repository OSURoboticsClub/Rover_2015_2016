#!/usr/bin/env python
import rospy
from std_msgs.msg import Bool

def grab_handle(grab_succ):
    rospy.loginfo(rospy.get_caller_id() + 
                  " grab was successful" if grab_succ else "grab failed")

def scan():

    # initialize node and name it scan
    rospy.init_node('scan', anonymous=False)

    # subscribe this node to the grab_success topic (published by grab)
    rospy.Subscriber('grab_success', Bool, grab_handle)

    rospy.spin()

if __name__ == '__main__':
    scan()
