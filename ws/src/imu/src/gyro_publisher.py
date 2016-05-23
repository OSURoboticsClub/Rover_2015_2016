#!/usr/bin/env python
import os, imp
lib_path = os.path.abspath(__file__)
for i in range(5):
    lib_path = os.path.dirname(lib_path)
libimu = imp.load_source('libimu', 
    (lib_path + '/uniboard/independent_IMU/libimu.py'))

import rospy
from imu.msg import gyro
from imu.srv import zero
import numpy as np

# Need actual serial adress
SERIAL = "/dev/ttyACM0"
SAMPLE_RATE = 100

class Gyro(object):
    def __init__(self):
        self.imu = libimu.IMU(SERIAL)
        self.pub = rospy.Publisher("/gyro", gyro, queue_size=10)
        self.s = rospy.Service('zero_gyro', 
                            zero, 
                            self.zero)


    def zero(self):
        self.imu.zero()
        return True

    def get_data(self):
        return self.imu.data()

    def publish_data(self):
        rate = rospy.Rate(SAMPLE_RATE)
        while not rospy.is_shutdown():
            data = self.get_data()
            if len(data) > 0:
                current = data.pop()
                omega_degrees = current['gyro'][1]
                theta_degrees = current['angle'][1]
                msg = gyro()
                msg.header.stamp = rospy.Time.now()
                msg.header.frame_id = '/imu'
                msg.theta = float(theta_degrees) * (-np.pi/180.0)
                msg.omega = float(omega_degrees) * (-np.pi/180.0)
                self.pub.publish(msg)
            rate.sleep()

if __name__ == '__main__':
    rospy.init_node('imu')
    g = Gyro()
    g.publish_data() 
