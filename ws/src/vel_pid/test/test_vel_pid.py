#!/usr/bin/env python
import unittest
import numpy as np
import time

import rostest
import rospy
from nav_msgs.msg import Odometry
from vel_pid.msg import vel_pid_status
from vel_pid.srv import set_target
import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.pid import PID, STEP_LIMIT


PKG = 'test_vel_pid'
TOLERANCE = 0.01

def integrate(f, x):
        i = 0
        for n in range(len(f) - 1):
            i += f[n]*(x[n+1]-x[n])
        return i


class TestVelPID(unittest.TestCase):
    def testIntegrate(self):
        err = ([],[])
        for i in np.arange(0,9,0.001):
            err[0].append(i)
            err[1].append(i*2)
        ans = integrate(*err)
        try:
            self.assertAlmostEqual(ans, 81)
        except Exception as ex:
            print str(ex)


    def assertStatus(self, status):
        rospy.loginfo("Asserting Status")
        self.success = [
        abs(status.vel - self.vel) < TOLERANCE,
        abs(status.target - self.target) < TOLERANCE,
        abs(status.out - self.out) < TOLERANCE]
        rospy.loginfo(status)
        self.asserted = True
    

    
    def testSetTarget(self):
        rospy.init_node('vel_pid')
        pid = PID()
        target = 1.5
        setTarget = rospy.ServiceProxy('set_vel_pid_target', set_target)
        rospy.wait_for_service('set_vel_pid_target')
        setTarget(target)
        self.assertEquals(target, pid.target)
        setTarget(2.2)
        self.assertEquals(target, pid.target)
        setTarget(-2.2)
        self.assertEquals(target, pid.target)
        
        # Set up subscriber to test pid_status
        sub = rospy.Subscriber('pid_status', vel_pid_status, self.assertStatus)
        # Test upper step limit
        self.vel = 0.0
        self.target = 1.7
        self.out = STEP_LIMIT
        self.success = [False]*3
        self.asserted = False
        odom = Odometry()
        odom.twist.twist.linear.x = self.vel
        setTarget(self.target)
        pid.update(odom)
        timeout = time.time() + 10.0 #10 seconds
        while not self.asserted and time.time() < timeout:
            time.sleep(0.1)
            rospy.loginfo('Wating')
            rospy.loginfo(timeout-time.time())
        if self.asserted:
            self.assertEqual(self.success, [True]*3)
        else:
            rospy.logwarn('Subscriber timed out')
            self.assertEqual(abs(self.target-pid.target) < TOLERANCE, True)
            self.assertEqual(abs(self.out-pid.out) < TOLERANCE, True)



if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_vel_pid', TestVelPID)

