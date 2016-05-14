#!/usr/bin/env python
from test_real_roving import RealRovingTest

import rospy
import time

PKG = 'test_real_roving'

class Rotate(RealRovingTest):
    """docstring for TestAlign"""
    def __init__(self):
        super(Rotate, self).__init__()

def main():
    t = Rotate()
    t.rotate(0.3, 30)
    for i in range(10):
        rospy.logwarn('Waiting for {} more seconds'.format(10-i))
        time.sleep(1) 
    t.rotate(-0.27, 30)   

if __name__ == '__main__':
    main()