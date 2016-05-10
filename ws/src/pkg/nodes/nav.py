#!/usr/bin/env python
import rospy
from pkg.msg import Coords3D
from std_msgs.msg import Bool
import sys
sys.path.insert(0, "../../../../uniboard/roverlib")
import uniboard
import time
import scan

halt_nav = False
ready_to_grab = False

#TODO: use the uniboard ROS service instead of this global
#u = uniboard.Uniboard("/dev/ttyUSB1")

def turn_to_sample(u, coords, precached):
    print "turning"
    rospy.loginfo("COORDS[0]: " + str(coords[0]))
    while coords[0] > 40 or coords[0] < -40:
       if coords[0] > 0:
          rospy.loginfo("turn right")
          u.motor_left(0.22)
          u.motor_right(-0.22)
          time.sleep(1)
          u.motor_left(0.0)
          u.motor_right(0.0)
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       elif coords[0] <= 0:
          rospy.loginfo("turn left")
          u.motor_left(-0.22)
          u.motor_right(0.22)
          time.sleep(1)
          u.motor_right(0.0)
          u.motor_left(0.0)
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)
       while coords is None:
          if precached:
              coords = scan.check_precached(scan_img_left, scan_img_right)
          else:
              coords = scan.check_easy_sample(scan_img_left, scan_img_right)

def move_til_sample(u, precached):
    u.arm_target("X", 0)
    u.arm_target("Y", u.arm_max("Y"))
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass
    u.motor_right(0.1)
    u.motor_left(0.1)
    while not rospy.is_shutdown():
       curr_crotch_img = new_crotch_img2
       xy = None
       while xy is None:
           curr_crotch_img = new_crotch_img2
           if precached:
               xy = grab.identify_precached(curr_crotch_img)
           else:
               xy = grab.identify_easy_sample(curr_crotch_img)
       time.sleep(0.5)
       u.motor_right(0.0)
       u.motor_left(0.0)
       break

def move_to_sample(sample_coords, precached):

    # this function takes the sample coordinates from the sample cam
    # and moves the rover over the sample so that the arm is able to 
    # pick it up

    # returns True once the rover is in position, False if it's unable to

    global u
    turn_to_sample(u, sample_coords, precached)
    move_til_sample(u, precached)

    return True


def handle_sample_coords(coords):
    rospy.loginfo(rospy.get_caller_id() + 
                  " sample detected at ({0},{1},{2})".format(
                  coords.x,coords.y,coords.z))
    precached = coords.precached
    if precached: rospy.loginfo('sample type: precached')
    else: rospy.loginfo('sample type: easy')

    global halt_nav
    halt_nav = True # stop navigation routine until sample is acquired
    in_position = move_to_sample(coords, precached)
    if in_position:
        global ready_to_grab
        ready_to_grab = True
    else:
        halt_nav = False

def grab_handle(grab_succ):
    rospy.loginfo(rospy.get_caller_id() +
                  " grab was successful" if grab_succ else "grab failed")
    global halt_nav
    halt_nav = False

def nav():

    # create publisher that publishes Bools to the grab_signal topic
    # consumed by grab
    pub = rospy.Publisher('grab_signal', Bool, queue_size=10)

    # initialize node and name it nav
    rospy.init_node('nav', anonymous=False)
    rospy.loginfo("entered nav state")

    # nav subscribes to the sample_coords topic (published by scan)
    rospy.Subscriber('sample_coords', Coords3D, handle_sample_coords)

    # nav subscribes to the grab_success topic (published by grab)
    rospy.Subscriber('grab_success', Bool, grab_handle)

    rate = rospy.Rate(10) # 10hz (processing time won't exceed 1/10 second)

    while not rospy.is_shutdown():
        if halt_nav:
            rospy.loginfo("navigation has been halted")
            while (not ready_to_grab) and halt_nav:
                # wait for move_to_sample to finish
                rate.sleep()

            if halt_nav:
                # publish to grab_signal
                rospy.loginfo("ready to grab - publishing grab signal")
                pub.publish(True)

            while halt_nav:
                # wait for grab to finish
                rate.sleep() 

            rospy.loginfo("navigation has been resumed")
        
        # normal navigation routines go here

        rate.sleep()

if __name__ == '__main__':
    try:
        nav()
    except rospy.ROSInterruptException:
        pass
