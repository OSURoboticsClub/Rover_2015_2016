#!/usr/bin/env python
"""publisher node that loops at a set rate (rospy.rate) and publishes message of type 'rpm' containing l/r rpm values and a header. 
""" 
import rospy
import numpy as np
from wheel_encoders.msg import rpm
from uniboard_communication.srv import *

class wheel_encoders():
    def __init__(self):
        rospy.init_node('rpm_publisher', anonymous=True)
        rospy.wait_for_service('uniboard_service')
        self.rate = rospy.Rate(100) # 100hz
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        # rpm value publisher
        self.pub = rospy.Publisher('encoder_values', rpm, queue_size=1000)

    def pub_encoders(self):
        while not rospy.is_shutdown():
            current_rpm = rpm()

            # retrive the rpm values for this iteration
            current_rpm.left_rpm = np.float32(self.uniboard_service('encoder_left_rpm', 3, str(0.0), rospy.Time.now()).data)
           
            current_rpm.right_rpm = np.float32(self.uniboard_service('encoder_right_rpm', 3, str(0.0), rospy.Time.now()).data)
            
            # fill out header values 
            current_rpm.header.stamp = rospy.Time.now()
            current_rpm.header.frame_id = '/encoder_values'

            self.pub.publish(current_rpm)
            self.rate.sleep()

if __name__ == '__main__':
    w = wheel_encoders()
    w.pub_encoders()
