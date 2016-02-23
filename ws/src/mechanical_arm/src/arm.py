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
        # Set up the arm
        
        try:
            for a in ['x','y','z']:
                self.uniboard_service('arm_en', 1, a, 'state', str(True), rospy.Time.now())
                self.uniboard_service('arm_go', 2, a, 'state', str(True), rospy.Time.now())
        except Exception as ex:
            return [False, 'Set up falied with ex: {}'.format(str(ex))]

        try:
            self.uniboard_service('arm_home', 1, None, None, None, rospy.Time.now())
        except Exception as ex:
            return [False, 'Homing failed with exception: {}'.format(str(ex))]
        try:
            self.uniboard_service('arm_target', 1, 'x', 'target', str(req.x), rospy.Time.now())
            self.uniboard_service('arm_target', 1, 'y', 'target', str(req.y), rospy.Time.now())
            self.uniboard_service('arm_target', 1, 'z', 'target', str(req.z), rospy.Time.now())
        except Exception as ex:
            return [False, 'Movement failed with exception: {}'.format(str(ex))]

        return [True, 'It Worked!']

    def publish_status(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            try:
                x = self.uniboard_service('arm_current', 10, 'x', None, None, rospy.Time.now())
                y = self.uniboard_service('arm_current', 10, 'y', None, None, rospy.Time.now())
                z = self.uniboard_service('arm_current', 10, 'z', None, None, rospy.Time.now())
                status = arm_status()
                status.status = 'Active'
                status.x = int(x.data)
                status.y = int(y.data)
                status.z = int(z.data)
                self.pub.publish(status)
                rate.sleep()
            except Exception as ex:
                status = arm_status()
                status.status = str(ex)
                
                self.pub.publish(status)
                rate.sleep()
            
        

if __name__ == '__main__':
    rospy.init_node('mechanical_arm')
    arm = MechanicalArm()
    rospy.spin()