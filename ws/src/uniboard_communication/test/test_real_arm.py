#!/usr/bin/env python
"""Testing for the real arm.

Attributes:
    BOARD (str): location of the uniboard, 'dev/ttyUSB1' if only the unoboard is 
    plugged in, 'dev/ttyUSB2' if the ADNS is plugged in first.
    PKG (str): Package name
    uniboard (TYPE): uniboard module
    uniboard_path (TYPE): path to uniboard module
"""

import sys, os, imp
import unittest
import rostest

import rospy

uniboard_path = os.path.abspath(__file__)
for i in range(5):
    uniboard_path = os.path.dirname(uniboard_path)
uniboard = imp.load_source('uniboard', 
    (uniboard_path+'/uniboard/roverlib/uniboard.py'))

PKG = 'test_real_arm'
BOARD = 'dev/ttyUSB1'

class TestRealArm(unittest.TestCase):
    """Test clas for testing the real arm.
    """
    def test_motion_z(self):
        """Test class for basic motion"""
        board = uniboard.Uniboard(BOARD)
        self.move_arm(board, 'z')

    def move_arm(self, board, axis):
        board.arm_en(axis, state=True)
        board.arm_go(axis, state=True)
        board.arm_target(axis, target=0.25)
        board.arm_target(axis, target=0.0)
        board.arm_target(axis, target=-0.25)


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_real_arm', TestRealArm)