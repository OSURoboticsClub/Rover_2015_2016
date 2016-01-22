#initial video test to aquire video and split

import numpy as np
import cv2
from matplotlib import pyplot as plt
#NOTE: Cameras are 120 mm (4.7 inches) apart

cap = cv2.VideoCapture(0)
cap.set(3, 1280)
cap.set(4, 1024)
window1 = cv2.namedWindow("window1", cv2.WINDOW_AUTOSIZE)
window2 = cv2.namedWindow("window2", cv2.WINDOW_AUTOSIZE)
window3 = cv2.namedWindow("window3", cv2.WINDOW_AUTOSIZE)
window4 = cv2.namedWindow("window4", cv2.WINDOW_AUTOSIZE)

stereo = cv2.StereoBM(cv2.STEREO_BM_BASIC_PRESET, ndisparities=16, SADWindowSize=15)

while(True):
    # Capture frame-by-frame
    ret, frame = cap.read()
    
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) 
    #print frame.size
    #test = frame[0:200, 0:390]  #length, width
    #print np.hsplit(frame, 2)
    test, b = np.hsplit(frame,2)

    
    # Our operations on the frame come here
    #gray = cv2.cvtColor(test, cv2.COLOR_BGR2GRAY)

    disparity = stereo.compute(test, b)
    disp = stereo.compute(test, b, disptype=cv2.CV_32F)
    norm_coeff = 255 / disp.max()
    #disp = cv2.normalize(sgbm.compute(test, b), alpha=0, beta=255, norm_type=cv2, NORM_MINIMAX, dtype=cv2.CV_8U)
    
    # Display the resulting frame
    cv2.imshow('window1', test)
    cv2.imshow('window2',b)
    cv2.imshow('window3',disparity)
    cv2.imshow('window4',disp) #* norm_coeff / 255)
    #plt.show()
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
