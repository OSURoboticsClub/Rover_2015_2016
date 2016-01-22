#this iteration builds in invert image function that could be used for multiple purposes.

import numpy as np
import cv2
from matplotlib import pyplot as plt
#NOTE: Cameras are 120 mm (4.7 inches) apart

# invert the image
def invertImage(img): return 255 - img

# Define Capture:
cap = cv2.VideoCapture(0) #record from camera 1
cap.set(3, 1280)          
cap.set(4, 1024)

# Define Windows:
leftWindow  = cv2.namedWindow("leftWindow",  cv2.WINDOW_AUTOSIZE)
rightWindow = cv2.namedWindow("rightWindow", cv2.WINDOW_AUTOSIZE)
dispWindow  = cv2.namedWindow("dispWindow",  cv2.WINDOW_AUTOSIZE)
colorWindow = cv2.namedWindow("colorWindow", cv2.WINDOW_AUTOSIZE)
invertWindow = cv2.namedWindow("invertWindow", cv2.WINDOW_AUTOSIZE)
bwWindow = cv2.namedWindow("bwWindow", cv2.WINDOW_AUTOSIZE)

stereo = cv2.StereoBM(cv2.STEREO_BM_BASIC_PRESET, ndisparities=96, SADWindowSize=15)

while(cv2.waitKey(1) & 0xFF != ord('q')): #Quit window using the 'q' key 
    ret, frame = cap.read() # Capture Frame by frame
    
    # Capture Frames:
    colorL, colorR = np.hsplit(frame,2)             # Split stereo into 2 images
    hsv = cv2.cvtColor(colorL, cv2.COLOR_BGR2HSV)    # Color Window
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # Gray Camera input
    imgL, imgR = np.hsplit(frame,2)                 # Split stereo into 2 images

    # Test image inversion:
    invertedImage = invertImage(imgL)
    
    # Convert inverted Image to black and white:
    (thresh, img_bw) = cv2.threshold(invertedImage, 128, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)  
    
    # define range of blue color in HSV:
    lower_blue = np.array([110, 50,  50])
    upper_blue = np.array([130, 255, 250])

    # Threshold the HSV image to get only blue colors:
    mask = cv2.inRange(hsv, lower_blue, upper_blue)

    # Bitwise-AND mask and original image:
    imgColor = cv2.bitwise_and(colorL, colorL, mask= mask)

    # Calculate Disparity:
    disp = cv2.normalize(stereo.compute(imgL, imgR), alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)    
    
    # Blur Disparity: 
    disp = cv2.medianBlur(disp, 5)
    disp = cv2.bilateralFilter(disp,9,200,25) #blur image for use    

    # Get Contours from Grey images and Draw: 
    ret, thresh = cv2.threshold(imgL, 127,255,0)            #left colored image
    contoursL, hierarchy = cv2.findContours(thresh, 1,2)    #find contours
    cv2.drawContours(colorL, contoursL, -1, (50,255,50), 3) #draw Left
    ret, thresh = cv2.threshold(imgR, 127,255,0)            #right colored image
    contoursR, hierarchy = cv2.findContours(thresh, 1,2)    #find contours
    cv2.drawContours(colorR, contoursR, -1, (50,255,50), 3) #draw Right
    #ret, thresh = cv2.threshold(invertedImage, 127,255,0)            #inverted left image
    #contoursI, hierarchy = cv2.findContours(thresh, 1,2)    #find contours
    #cv2.drawContours(invertedImage, contoursI, -1, (0,0,0), 3) #draw Invert

    # Get Contours from Color image:
    hsv_grey = cv2.cvtColor(imgColor, cv2.COLOR_BGR2GRAY) # Gray Camera input
    ret, thresh = cv2.threshold(hsv_grey, 127,255,0)
    contoursC, hierarchy = cv2.findContours(thresh, 1,2)    
    cv2.drawContours(imgColor, contoursC, -1, (0,255,50), 3) #draw Color
 
    # Display the resulting frame
    cv2.imshow('leftWindow', colorL)
    cv2.imshow('rightWindow',colorR)
    cv2.imshow('colorWindow',imgColor)
    cv2.imshow('dispWindow', disp )
    cv2.imshow('invertWindow', invertedImage )
    cv2.imshow('bwWindow', img_bw )

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
