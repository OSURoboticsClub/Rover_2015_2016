#!/usr/bin/env python
"""Tests for flodometry node with actual rover motion.

Attributes:
    PKG (str): Package Name
    RUNTIME (int): Length of time to power rover. 
"""

import rospy
import time
import os
from uniboard_communication.srv import *

# The right wheel is powered at left_wheel+OFFSET
OFFSET = 0.02


class RealRovingTest(object):
    """
    """
    def __init__(self):
        rospy.init_node('test_real_roving')
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
    

    def drive_straight(self, power, run_time):
        """
        """
        self.uniboard_service('motor_left', 3, str(power), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(power+OFFSET), rospy.Time.now())
        for i in range(0, run_time):
            rospy.logwarn('Driving for {} more seconds'.format(run_time-i))
            time.sleep(1)
        self.uniboard_service('motor_left', 3, str(0.0), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.0), rospy.Time.now())


    def rotate(self, power, run_time):
        self.uniboard_service('motor_left', 3, str(-power), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(power+OFFSET), rospy.Time.now())
        for i in range(0, run_time):
            rospy.logwarn('Driving for {} more seconds'.format(run_time-i))
            time.sleep(1)
        self.uniboard_service('motor_left', 3, str(0.0), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.0), rospy.Time.now())
        
