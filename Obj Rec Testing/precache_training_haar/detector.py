#!/usr/bin/env python3

import numpy as np
import cv2

cascade = cv2.CascadeClassifier("data/cascade.xml")

win = cv2.namedWindow("window", cv2.WINDOW_AUTOSIZE)
cap = cv2.VideoCapture(0)

while True:
    val, img = cap.read()
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    obj = cascade.detectMultiScale(gray, 1.1, 5)
    for (x,y,w,h) in obj:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
    cv2.imshow("window", img)
    if cv2.waitKey(30) & 0xFF == 27:
        break
    
cv2.destroyAllWindows()
cap.release()

