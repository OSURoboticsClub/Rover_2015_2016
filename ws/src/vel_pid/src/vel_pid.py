#!/usr/bin/env python
import rospy

from uniboard_communication.srv import *
from nav_msgs.msg import Odometry

class PID(object):
    def __init__(self):
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        #self.pub = rospy.Publisher('pid_status', arm_status, queue_size=10)
        self.sub = rospy.Subscriber('/odom', Odometry, self.update)


    def update(self):
        pass