#!/usr/bin/env python3

'''This is a program to create the files needed for training a 
cascade classifier. These include a positives.info file, which 
contains the file name of each positive image, the number of 
objects in the image, the lower left x and y coordinates of the
rectangle bounding the part of the image containing the sample, 
and the width and height of the rectangle, all in that order.
This program assumes the sample takes up the whole image. The
other file, negatives.dat, is a list of all the negative images.
The positive and negative images are assumed to be in their
respective folders.'''

import os
import re

import numpy
import cv2

basedir = os.getcwd()
regex = re.compile(r".jpg$")

with open("positives.info", "w+") as f:
    os.chdir(basedir + "/" + "positives/")
    for img_file in os.listdir():
        if re.search(regex, img_file):
            img = cv2.imread(img_file)
            h, w, _ = img.shape
            fname = "positives/" + img_file 
            f.write(fname + " 1 0 0 %i %i\n" % (w, h))

os.chdir(basedir)
with open("negatives.dat", "w+") as f:
    os.chdir(basedir + "/" + "negatives/")
    for img_file in os.listdir():
        if re.search(regex, img_file):
            fname = "negatives/" + img_file
            f.write(fname + "\n")
        
os.chdir(basedir)
