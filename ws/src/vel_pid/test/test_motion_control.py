#!/usr/bin/env python
import unittest
import rosbag, rospy, rostest
import sys, os

from bunch import Bunch

PKG="test_motion_control"

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.motion_control import MotionControl
from vel_pid.srv import set_target
from geometry_msgs.msg import Twist

class TestMotionControl(unittest.TestCase):
    def test_set_vel(self):
        mc = MotionControl()
        t = Twist()
        t.linear.x = 0.6
        t.angular.z = 0.12
        mc.set_vel(t)
        self.assertEquals(mc.vel_pid.target, 0.6)
        self.assertEquals(mc.rot_pid.target, 0.12)


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_motion_control', TestMotionControl)