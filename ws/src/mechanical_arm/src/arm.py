#!/usr/bin/env python
import rospy

from uniboard_communication.srv import *
from mechanical_arm.msg import *
from mechanical_arm.srv import *

class MechanicalArm(object):
    """

    """
    def __init__(self):
        rospy.wait_for_service('uniboard_service')
        self.uniboard_service = rospy.ServiceProxy('uniboard_service', communication)
        self.pub = rospy.Publisher('arm_status', arm_status, queue_size=10)
        self.s = rospy.Service('move_arm', arm_position, self.move_arm)
        self.publish_status()

    def move_arm(self, req):
        pass

    def publish_status(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            status = arm_status()
            status.status = 'Test'
            status.x = 0
            status.y = 0
            status.z = 0
            self.pub.publish(status)
            rate.sleep()
            
        

if __name__ == '__main__':
    rospy.init_node('mechanical_arm')
    arm = MechanicalArm()
    rospy.spin()