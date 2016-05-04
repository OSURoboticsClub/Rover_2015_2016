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
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from src.Flodometry import Flodometry

class TestFlodometry(unittest.TestCase):
    """TestFlodometry"""
    def test_flow_x(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, 'bags/run_four.bag')
        bag = rosbag.Bag(path)
        optical_flow = bag.read_messages(topics=['/optical_flow'])
        f = Flodometry()
        squal = []
        dx = []
        dy = []
        flow_time = []
        flow_x = []
        for topic, msg, t in optical_flow:
            f.update_flow(msg)
            flow_x.append(f.flow_x.x[0])
            squal.append(msg.squal)
            dx.append(msg.dx)
            dy.append(msg.dy)
            flow_time.append(t.to_time())
        filtered_dx = dx[10:110]
        filtered_time = flow_time[10:110]
        print np.mean(filtered_dx)
        self.plot(flow_time, dx, 'dx')
        self.plot(flow_time, flow_x, 'filtered_velocity')


    def test_flow_y(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, 'bags/run_four.bag')
        bag = rosbag.Bag(path)
        optical_flow = bag.read_messages(topics=['/optical_flow'])
        f = Flodometry()
        squal = []
        dy = []
        flow_time = []
        flow_y = []
        for topic, msg, t in optical_flow:
            f.update_flow(msg)
            flow_y.append(f.flow_y.x[0])
            squal.append(msg.squal)
            dy.append(msg.dy)
            flow_time.append(t.to_time())
        filtered_dy = dy[10:110]
        filtered_time = flow_time[10:110]
        print 'Raw data analysis mean:{1} std:{0}'.format(
                                    np.std(filtered_dy),
                                    np.mean(filtered_dy))
        self.plot(filtered_time, filtered_dy, 'dy')
        self.plot(flow_time, flow_y, 'filtered_velocity')


    def test_enc_left(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, 'bags/run_four.bag')
        bag = rosbag.Bag(path)
        f = Flodometry()
        encoder_values= bag.read_messages(topics=['/encoder_values'])
        enc_time = []
        enc_left = []
        vel_left = []
        enc_right = []
        for topic, msg, t in encoder_values:
            f.update_encoders(msg)
            vel_left.append(f.vel_left.x[0])
            enc_time.append(t.to_time())
            enc_left.append(msg.left_rpm)
            enc_right.append(msg.right_rpm)
        self.plot(enc_time, enc_left, 'enc_left')
        self.plot(enc_time, vel_left, 'vel_left')


    def test_enc_right(self):
        path = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(path, 'bags/run_four.bag')
        bag = rosbag.Bag(path)
        f = Flodometry()
        encoder_values= bag.read_messages(topics=['/encoder_values'])
        enc_time = []
        enc_right = []
        vel_right = []
        for topic, msg, t in encoder_values:
            f.update_encoders(msg)
            vel_right.append(f.vel_right.x[0])
            enc_time.append(t.to_time())
            enc_right.append(msg.right_rpm)
        self.plot(enc_time, enc_right, 'enc_right')
        self.plot(enc_time, vel_right, 'vel_right')
        

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
            plt.figure()
            plt.plot(x,y)
            plt.title(title)
            plt.axis([min(x), max(x), min(y), max(y)])
            plt.show()
        else:
            rospy.logerr('No data for {}'.format(title))


if __name__ == '__main__':
    rostest.rosrun(PKG, 'test_flodometry', TestFlodometry)
        