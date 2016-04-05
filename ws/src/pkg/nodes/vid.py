#!/usr/bin/env python
import rospy
import grab
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import time

new_crotch_img2 = None
bridge = CvBridge()

def handle_img(img):
    global new_crotch_img2
    # convert ROS image message to numpy array for OpenCV
    try:
        new_crotch_img2 = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        rospy.logerror(e)

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
        
    # MOVE BACKWARD X meters
        
    # DROP SAMPLE

if __name__ == '__main__':
    try:
        vid()
    except rospy.ROSInterruptException:
        pass
