lib_path = os.path.abspath(__file__)
for i in range(5):
    lib_path = os.path.dirname(lib_path)
libimu = imp.load_source('libimu', 
    (lib_path+'/uniboard/independent_IMU/libimu.py'))

import rospy
from imu.msg import gyro
import numpy as np

# Need actual serial adress
SERIAL = "/dev/ttyUSBIMU"
SAMPLE_RATE = 100

class Gyro(object):
    def __init__(self):
        self.imu = libimu.IMU(SERIAL)
        self.pub = rospy.Publisher("/gyro", gyro, queue_size=10)

    def zero(self):
        self.imu.zero()

    def get_data(self):
        return self.imu.data()

    def publish_data(self):
        rate = rospy.Rate(SAMPLE_RATE)
        while not rospy.is_shutdown():
            data = self.get_data()
            if len(data) > 0:
                current = data.pop()
                omega_degrees = current['gyro']
                msg = gyro()
                msg.header.stamp = rospy.Time.now()
                msg.header.frame_id = '/imu'
                msg.omega = omega_degrees * (np.pi/180.0)
                self.pub.publish(msg)
            rate.sleep()
