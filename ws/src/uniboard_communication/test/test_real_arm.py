#!/usr/bin/env python

import sys
import unittest
import rostest

import rospy
from uniboard_communication.srv import *
from uniboard_service import UniboardCommunication

uniboard_path = os.path.abspath(__file__)
for i in range(5):
    uniboard_path = os.path.dirname(uniboard_path)
uniboard = imp.load_source('uniboard', 
    (uniboard_path+'/uniboard/roverlib/uniboard.py'))

PKG = 'test_real_arm'

class TestRealArm(unittest.TestCase):
    def test_motion:
        board = uniboard.Uniboard(board)

if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_uniboard_service', TestUniboardService)