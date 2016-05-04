#!/usr/bin/env python
import unittest
import numpy as np
import time

from bunch import Bunch
import rostest
import rospy
from nav_msgs.msg import Odometry
from vel_pid.msg import vel_pid_status
from vel_pid.srv import set_target
import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.motion_control import MotionControl


PKG = 'test_vel_pid'

class TestMotionControl(object):
    def test_vel_pid(self):
        rospy.init_node('test_vel_pid')
        controller = MotionControl()
        goal = Bunch()
        goal.target = 5.0
        controller.motion_goal(goal)
        for i in range(30):
            rospy.logwarn(i)
            time.sleep(1)
        controller.stop()
    



if __name__ == '__main__':
    test = TestMotionControl()
    test.test_vel_pid()

