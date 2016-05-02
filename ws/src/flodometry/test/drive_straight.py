#!/usr/bin/env python
from test_real_roving import RealRovingTest

import rospy

PKG = 'test_real_roving'

class DriveStraight(RealRovingTest):
    """docstring for TestAlign"""
    def __init__(self):
        super(DriveStraight, self).__init__()

def main():
    t = DriveStraight()
    t.drive_straight(0.25, 30)
    time.sleep(10) 
    t.drive_straight(-0.25, 30)   

if __name__ == '__main__':
    main()
        
