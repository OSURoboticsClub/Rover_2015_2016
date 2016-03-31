#!/usr/bin/env python
import rostest
import rospy
import unittest

PKG = 'test_real_roving'

class TestRealRoving(unittest.TestCase):
    def test_constant_speed(self):
        pass

if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_real_roving', TestRealRoving)