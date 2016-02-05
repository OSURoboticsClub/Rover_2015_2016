#!/usr/bin/env python
import rospy
from pkg.msg import Coords3D

halt_nav = False
ready_to_grab = False

def move_to_sample(sample_coords):

    # TODO: 
    # this function takes the sample coordinates from the sample cam
    # and moves the rover over the sample so that the arm is able to 
    # pick it up

    # returns True once the rover is in position, False if it's unable to

    return True # temporary value, for testing


def handle_sample_coords(coords):
    rospy.loginfo(rospy.get_caller_id() + 
                  " sample detected at ({0},{1},{2})".format(
                  coords.x,coords.y,coords.z))
    global halt_nav
    halt_nav = True # stop navigation routine until sample is acquired
    in_position = move_to_sample(coords)
    if in_position:
        global ready_to_grab
        ready_to_grab = True
    else:
        halt_nav = False


def nav():

    # initialize node and name it nav
    rospy.init_node('nav', anonymous=False)
    rospy.loginfo("entered nav state")

    # nav subscribes to the sample_coords topic (published by scan)
    rospy.Subscriber('sample_coords', Coords3D, handle_sample_coords)

    rate = rospy.Rate(10) # 10hz (processing time won't exceed 1/10 second)

    while not rospy.is_shutdown():
        if halt_nav:
            rospy.loginfo("navigation has been halted")
            while (not ready_to_grab) and halt_nav:
                # wait for move_to_sample to finish
                rate.sleep()

            # publish to grab_signal

            #while halt_nav:
            #    # wait for grab to finish
            #    try: 
            #        pass
            #    except rospy.ROSInterruptException: # so that we can force stop
            #        break

            rospy.loginfo("navigation has been resumed")
        
        # normal navigation routines go here

        rate.sleep()

if __name__ == '__main__':
    try:
        nav()
    except rospy.ROSInterruptException:
        pass
