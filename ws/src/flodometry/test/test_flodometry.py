#!/usr/bin/env python
import unittest
from nose import with_setup
import numpy as np
from bunch import Bunch
import rosbag
import rospy
import rostest
import sys, os
import matplotlib.pyplot as plt

PKG='test_flodometry'
BAG_NAME = 'bags/test_straight_2016-05-05-15-00-45.bag'
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.Flodometry import Flodometry

class TestFlodometry(unittest.TestCase):
    """TestFlodometry"""
    def test_flow_x(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, BAG_NAME)
        bag = rosbag.Bag(path)
        optical_flow = bag.read_messages(topics=['/optical_flow'])
        f = Flodometry()
        squal = []
        dx = []
        dy = []
        flow_time = []
        flow_x = []
        flow_y = []
        for topic, msg, t in optical_flow:
            f.update_flow(msg)
            flow_x.append(f.flow_x.x[0])
            dx.append(msg.dx)
            dy.append(msg.dy)
            flow_time.append(t.to_time())
            flow_y.append(f.flow_y.x[0])
            squal.append(msg.squal)

        plt.figure()        
        plt.subplot(2, 2, 1)
        self.plot(flow_time, dx, 'dx')
        plt.subplot(2, 2, 2)
        self.plot(flow_time, flow_x, 'filtered_velocity')
        plt.subplot(2,2,3)
        self.plot(flow_time, dy, 'dy')
        plt.subplot(2,2,4)
        self.plot(flow_time, flow_y, 'filtered_velocity')
        # self.plot(flow_time, squal, 'Surface Quality')
        plt.show()


    


    def test_enc(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, BAG_NAME)
        bag = rosbag.Bag(path)
        f = Flodometry()
        encoder_values= bag.read_messages(topics=['/encoder_values'])
        enc_time = []
        enc_left = []
        vel_left = []
        enc_right = []
        vel_right = []
        for topic, msg, t in encoder_values:
            f.update_encoders(msg)
            vel_left.append(f.vel_left.x[0])
            vel_right.append(f.vel_right.x[0])
            enc_time.append(t.to_time())
            enc_left.append(msg.left_rpm)
            enc_right.append(msg.right_rpm)
        plt.figure()
        plt.subplot(2, 2, 1)
        self.plot(enc_time, enc_left, 'enc_left')
        plt.subplot(2, 2, 2)
        self.plot(enc_time, vel_left, 'vel_left')
        plt.subplot(2,2,3)
        self.plot(enc_time, enc_right, 'enc_right')
        plt.subplot(2,2,4)
        self.plot(enc_time, vel_right, 'vel_right')
        plt.show()

        

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
            
            plt.plot(x,y)
            plt.title(title)
            plt.axis([min(x), max(x), min(y), max(y)])
            
        else:
            rospy.logerr('No data for {}'.format(title))

    def calibrate(self, dx, dy, t, flow_x, flow_y, enc_left, enc_right):
        pass


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_flodometry', TestFlodometry)
        