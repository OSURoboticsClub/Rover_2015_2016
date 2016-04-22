#!/usr/bin/env python
"""Tests for flodometry node with actual rover motion.

Attributes:
    PKG (str): Package Name
    RUNTIME (int): Length of time to power rover. 
"""
import rostest
import rospy
import unittest
import time
import os

from uniboard_communication.srv import *
from flodometry.msg import motion_read
from nav_msgs.msg import Odometry
import matplotlib.pyplot as plt

RUNTIME = 10

PKG = 'test_real_roving'

class TestRealRoving(object):
    """Test class for node flodometry
    
    Attributes:
        flow_time (list): Time values published to /optical_flow
        motion_x (list): Motion values published to /optical_flow
        odom_time (list): Time values published to /odom
        pos (list): Position value posted to /odom
        shutter (list): Shutter speed posted to /optical_flow
        uniboard_service (rospy.Service): Service to set motor speeds 
        vel (list): Velocities published to /odom
    """
    def test_constant_speed(self):
        """Sets the rover to a constant speed for a set amount of time 
         while recordng data. 
        
        Returns:
            None
        """
        self.odom_time = []
        self.flow_time = []
        self.vel = []
        self.pos = []
        self.motion_x = []
        self.shutter = []
        rospy.init_node('test_real_roving')
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        rospy.Subscriber('/odom', Odometry, self.updateOdom)
        rospy.Subscriber("/optical_flow", motion_read, self.updateFlow)
        rospy.Subscriber("/encoders", motion_read, self.updateFlow)
        self.uniboard_service('motor_left', 3, str(0.5), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.5), rospy.Time.now())
        time.sleep(RUNTIME)
        self.uniboard_service('motor_left', 3, str(0.0), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.0), rospy.Time.now())
        # self.plot(self.flow_time, self.motion_x, 'Motion x')
        # self.plot(self.flow_time, self.shutter, 'Shutter')
        # self.plot(self.odom_time, self.vel, 'Velocity')
        # self.plot(self.odom_time, self.pos, 'Position')
       

    def plot(self, x, y, title):
        """Plots and saves data compiled in test
        
        Args:
            x (List): X-value to plot
            y (List): Y-value to plot
            title (str): Title of plot
        
        Returns:
            None
        """
        if len(x) > 0 and len(y) > 0:
            location = os.path.dirname(os.path.abspath(__file__))
            out = open(location+title+'.txt', 'w')
            for i in range(len(x)):
                out.write('{}, {}\n'.format(x[i], y[i]))
            out.close()
            plt.figure()
            plt.plot(x,y)
            plt.title(title)
            plt.axis([min(x), max(x), min(y), max(y)])
            plt.show()
        else:
            rospy.logerr('No data for {}'.format(title))


    def updateOdom(self, odom):
        """Callback for /odom subscriber, saves data to class variables
        
        Args:
            odom (Odometry): Message from /odom
        
        Returns:
            None
        """
        self.odom_time.append(odom.header.stamp.to_time())
        self.vel.append(odom.twist.twist.linear.x)
        self.pos.append(odom.pose.pose.position.x)

    def updateFlow(self, flow):
        """Callback for /optical_flow subscribe, saves data to class variables
        
        Args:
            flow (motion_read): message from /optical_flow
        
        Returns:
            None
        """
        self.flow_time.append(flow.header.stamp.to_time())
        self.motion_x.append(flow.dx)
        self.shutter.append(flow.shutter)



if __name__ == '__main__':
    t = TestRealRoving()
    t.test_constant_speed()
