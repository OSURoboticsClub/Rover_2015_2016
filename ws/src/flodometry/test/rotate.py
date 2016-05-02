#!/usr/bin/env python
from test_real_roving import RealRovingTest

import rospy

PKG = 'test_real_roving'

class Rotate(RealRovingTest):
    """docstring for TestAlign"""
    def __init__(self):
        super(Rotate self).__init__()

def main():
    t = Rotate()
    t.rotate(0.1, 30)
    time.sleep(10) 
    t.rotate(-0.1, 30)   

if __name__ == '__main__':
    main()