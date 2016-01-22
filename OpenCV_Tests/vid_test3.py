#this iteration attempts to improve the disparity image by smoothing

import numpy as np
import cv2
from matplotlib import pyplot as plt
#NOTE: Cameras are 120 mm (4.7 inches) apart

# Define Capture:
cap = cv2.VideoCapture(0) #record from camera 1
cap.set(3, 1280)          
cap.set(4, 1024)

# Define Windows:
leftWindow  = cv2.namedWindow("leftWindow",  cv2.WINDOW_AUTOSIZE)
rightWindow = cv2.namedWindow("rightWindow", cv2.WINDOW_AUTOSIZE)
dispWindow  = cv2.namedWindow("dispWindow",  cv2.WINDOW_AUTOSIZE)
colorWindow = cv2.namedWindow("colorWindow", cv2.WINDOW_AUTOSIZE)

stereo = cv2.StereoBM(cv2.STEREO_BM_BASIC_PRESET, ndisparities=96, SADWindowSize=15)

while(cv2.waitKey(1) & 0xFF != ord('q')): #Quit window using the 'q' key 
    ret, frame = cap.read() # Capture Frame by frame
    
    # Capture Frames:
    colorL, colorR = np.hsplit(frame,2)             # Split stereo into 2 images
    hsv = cv2.cvtColor(colorL, cv2.COLOR_BGR2HSV)    # Color Window
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # Gray Camera input
    imgL, imgR = np.hsplit(frame,2)                 # Split stereo into 2 images
    
    # Downscale images:
    # imgL = cv2.pyrDown(imgL)
    # imgR = cv2.pyrDown(imgR)

    # define range of blue color in HSV:
    lower_blue = np.array([110, 50,  50])
    upper_blue = np.array([130, 255, 250])

    # Threshold the HSV image to get only blue colors:
    mask = cv2.inRange(hsv, lower_blue, upper_blue)

    # Bitwise-AND mask and original image:
    imgColor = cv2.bitwise_and(colorL, colorL, mask= mask)

    # Calculate Disparity:
    #disp = stereo.compute(imgR, imgL).astype(np.float32) / 16
    disp = cv2.normalize(stereo.compute(imgL, imgR), alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)    
    disp = cv2.medianBlur(disp, 5)
    disp = cv2.bilateralFilter(disp,9,75,75) #blur image for use    
 
    # Display the resulting frame
    cv2.imshow('leftWindow', imgL)
    cv2.imshow('rightWindow',imgR)
    cv2.imshow('colorWindow',imgColor)
    cv2.imshow('dispWindow', disp )
    
    if cv2.waitKey(1) & 0xFF == ord('q'): break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
