#!/usr/bin/env python

import rospy
import math
import numpy as np

from filterpy.kalman import KalmanFilter
from filterpy.common import Q_discrete_white_noise
from flodometry.msg import motion_read
from nav_msgs.msg import Odometry

class Flodometry(object):
    def __init__(self):
        self.setup_kalman()
        # Subscribe to the adns topic 
        rospy.Subscriber("/optical_flow", motion_read, self.update)
        # Initialize the publisher
        self.pub = rospy.Publisher("/odom", Odometry, queue_size=10)
        self.last = None
        self.dt = []

    def setup_kalman(self):
        # Initialize Kalman filter with 2 state variables and one measurement
        self.kf = KalmanFilter(dim_x=2, dim_z=1)
        # Set initial position and velocity at 0
        self.kf.x = np.array([0.0, 0.0])
        # Set state transition with average dt of 0.1
        self.kf.F = np.array([[1, 0.1],
                        [0,  1]])  
        # Initialize the measurment transform with beta value from
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        self.kf.H = np.array([0.0, (1.0/0.035)])
        # Set initial variance to 0 since state is known
        self.kf.P *= 0
        # Initialize process noise with variance of max vel and white noise and dt of 0.1
        self.kf.Q = Q_discrete_white_noise(dim=2, dt=0.1, var=0.2)
        self.kf.R = np.array([[0.1]])

    def update(self, motion):
        speed = math.sqrt(motion.dx**2+motion.dy**2)
        if motion.dx < 0 and motion.dy < 0:
            vel = speed * -1
        else:
            vel = speed
        # Set measurment accuaracy to 0.1 speed per 
        # file:///home/loren/Downloads/CTS12-37%20(1).pdf
        
        self.kf.predict()
        z = np.array(vel)
        z.shape = ()
        self.kf.update(z)

    def publish_updates(self):
        import IPython; IPython.embed()

if __name__ == '__main__':
    rospy.init_node('flodometry')
    f = Flodometry()
    f.publish_updates()
    rospy.spin()

