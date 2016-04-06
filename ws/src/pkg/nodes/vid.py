#!/usr/bin/env python
import rospy
import grab
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import time
import sys
sys.path.insert("../../../../uniboard/roverlib")
import uniboard

new_crotch_img2 = None
bridge = CvBridge()

def handle_img(img):
    global new_crotch_img2
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img2 = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

def pick_up(coords):
    u = uniboard.Uniboard("/dev/ttyUSB1")

    u.arm_home() # set elements to center, test all elements
    u.arm_target("Y", u.arm_max("Y")) # move all the way back
    u.arm_target("X", u.arm_max("X")) # move all the way back

    # make sure that you wait until arm_moving is false
    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

    u.arm_target("Y", u.arm_max("Y")/2) # move to center
    u.arm_target("X", u.arm_max("X")/2) # move to center

    while u.arm_should_be_moving("X") or u.arm_should_be_moving("Y"): pass

    u.arm_target("Z", 0)
    u.arm_z_wait_until_done()

    u.arm_target("A", 0)
    while u.arm_should_be_moving("A"): pass

    u.arm_target("Z", 0.5)
    u.arm_z_wait_until_done()

def vid():
    rospy.init_node('vid', anonymous=False)
    rospy.loginfo('node initialized')    
    rospy.Subscriber('crotch/image/image_raw', Image, handle_img)
    rate = rospy.Rate(10)
    
    # MOVE FORWARD X meters

    # DETERMINE COORDINATES OF SAMPLE
    #while not rospy.is_shutdown():
    time.sleep(3)
    if new_crotch_img2 is not None:
       curr_crotch_img = new_crotch_img2
       xy = grab.identify_easy_sample(curr_crotch_img)
       print xy

    # PICK UP SAMPLE
    pick_up(xy)
        
    # MOVE BACKWARD X meters
        
    # DROP SAMPLE

if __name__ == '__main__':
    try:
        vid()
    except rospy.ROSInterruptException:
        pass
