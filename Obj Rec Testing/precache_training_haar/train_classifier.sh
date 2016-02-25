#!/bin/bash

mkdir data
opencv_traincascade -data data -vec positives.vec -bg negatives.dat -numPos 15 -numNeg 15 -w 24 -h 48
