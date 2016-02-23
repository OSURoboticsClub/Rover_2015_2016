#!/usr/bin/env python
import rospy

from mechanical_arm.srv import *

def run_test():
    move_arm = rospy.ServiceProxy('move_arm', arm_position)
    resp = move_arm(3,2,1)
    import IPython; IPython.embed()

if __name__ == '__main__':
    rospy.wait_for_service('move_arm')
    run_test()