#!/usr/bin/env python
"""This is not used with publishing.
can be run after the launch file is run to verify encoder publisher is working 
"""

import rospy
import time
import os

from uniboard_communication.srv import *

RUNTIME = 2
class TestEncoders(object):
  
    def test_constant_speed(self):
        rospy.init_node('test_encoders')
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
      
        self.uniboard_service('motor_left', 3, str(0.3), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.3), rospy.Time.now())
	
        time.sleep(RUNTIME)
       
        self.uniboard_service('motor_left', 3, str(-0.3), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(-0.3), rospy.Time.now())

 	time.sleep(RUNTIME)

        self.uniboard_service('motor_left', 3, str(0.0), rospy.Time.now())
        self.uniboard_service('motor_right', 3, str(0.0), rospy.Time.now())        
      
if __name__ == '__main__':
    t = TestEncoders()
    t.test_constant_speed()
