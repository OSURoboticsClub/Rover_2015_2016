#!/usr/bin/env python
import unittest
import numpy as np
import time

import rostest
import rospy
from nav_msgs.msg import Odometry
from vel_pid.msg import vel_pid_status
from vel_pid.srv import set_target


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
    

    def testVelPID(self):
        # Test set target and STEP_LIMIT
        self.asserted = False
        self.vel = 0.0
        self.target = 1.7
        self.out = 0.1
        self.success = [False]*3
        pub = rospy.Publisher("/odom", Odometry, queue_size=10)
        rospy.init_node('test_vel_pid')
        sub = rospy.Subscriber('pid_status', vel_pid_status, self.assertStatus)
        pid = rospy.ServiceProxy('set_vel_pid_target', set_target)
        rospy.wait_for_service('set_vel_pid_target')
        pid(self.target)
        odom = Odometry()
        odom.twist.twist.linear.x = self.vel
        pub.publish(odom)
        timeout = time.time() + 10.0*1000 #10 seconds
        while not self.asserted and time.time() < timeout:
            time.sleep(0.1)
            rospy.loginfo('Wating')
            rospy.loginfo(timeout-time.time())
        
        # Wait a second to check
        self.assertEqual(self.success, [True]*3)
        self.success = [False]*3
        # Test negative step limit
        self.vel = 2.0
        self.target = 0.0
        self.out = -0.1
        pid(self.target)
        odom = Odometry()
        odom.twist.twist.linear.x = self.vel
        pub.publish(odom)
        timeout = time.time() + 10.0 #10 seconds
        while not self.asserted and time.time() < timeout:
            time.sleep(0.1)
            rospy.loginfo('Wating')
            rospy.loginfo(timeout-time.time())
        self.assertEqual(self.success, [True]*3)


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_vel_pid', TestVelPID)

