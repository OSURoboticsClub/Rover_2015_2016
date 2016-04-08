#!/usr/bin/env python
import unittest
import rosbag, rospy, rostest
import sys, os

from bunch import Bunch

PKG="test_motion_control"

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.motion_control import MotionControl
from vel_pid.srv import set_target

class TestMotionControl(unittest.TestCase):
    def test_vel_pid(self):
        mc = MotionControl()
        mc.set_vel(3)
        self.assertEquals(0, mc.vel_pid.target)
        mc.set_vel(0.5)
        self.assertEquals(0.5, mc.vel_pid.target)


    def test_pos_pid(self):
        mc = MotionControl()
        target = Bunch()
        target.target = 10
        resp = mc.motion_goal(target)
        self.assertEquals(False, resp)
        target.target = 4.3
        self.assertEqual(mc.pos_pid.inRange, [-5.0, 5.0])
        resp = mc.motion_goal(target)
        self.assertEquals(True, resp)

if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_motion_control', TestMotionControl)