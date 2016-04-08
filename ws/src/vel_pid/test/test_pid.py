#!/usr/bin/env python
import unittest
import rostest
from bunch import Bunch

import rospy
import sys, os
import time
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import numpy as np

from src.pid import PID, STEP_LIMIT

PKG = 'test_pid'

TOLERANCE = 0.01

class TestPID(unittest.TestCase):
    """Test Class for PID"""
    def test_integrate(self):
        pid = PID(None, None, None, None, None, None, 'test_pid')
        err = ([],[])
        for i in np.arange(0,9,0.001):
            err[0].append(i)
            err[1].append(i*2)
        ans = pid.integrate(*err)

    def test_pid(self):
        # math for test:
        #  target:  1    1      1    
        # current:  0    0.25   1
        #     err:  1    0.75   0
        #       P:  0.5  0.375  0
        #       I:  0    0.875  0.875
        #       D:  0   -0.125 -0.375
        #     out:  0.5  1.125  0.5
        rospy.init_node('test_pid')
        target = Bunch()
        self.testOut = 0
        def pidOut(out):
            diff = self.testOut - out
            self.assertEquals(abs(diff) < TOLERANCE, True)
        pid = PID(pidOut, 0.5, 0.5, 0.5, [-2,2], [-1,1], 'test_pid')
        target = 3
        self.assertEquals(False, pid.set_target(target))
        pid.update(0)
        target = 1
        self.assertEquals(True, pid.set_target(target))
        self.testOut = 0.5
        pid.update(0)
        time.sleep(0.01)
        self.testOut = 1
        pid.update(0.25)
        time.sleep(0.01)
        self.testOut = 0.5
        pid.update(1.0)
        time.sleep(0.01)


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_pid', TestPID)
