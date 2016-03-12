#!/usr/bin/env python3

import numpy as np
import cv2

cascade = cv2.CascadeClassifier("cascade.xml")

def detect_precached(img):
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    obj = cascade.detectMultiScale(gray, 1.1, 5)
    for (x,y,w,h) in obj:
        return (x+(w/2),y+(h/2)) # center of object

