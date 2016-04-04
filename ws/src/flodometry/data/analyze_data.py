#!/usr/bin/env python
import numpy as np
import sys

def printDataStats(data):
        std = np.std(data)
        var = std**2
        length = len(data)
        minimum = min(data)
        maximum = max(data)
        mean = np.mean(data)
        median = np.median(data)
        print '{} data points \n'.format(length)
        print 'Minimum Value = {}\n'.format(minimum)
        print 'Maximum Value = {}\n'.format(maximum)
        print 'Mean Value = {}\n'.format(mean)
        print 'Standard Deviation = {}\n'.format(std)
        print 'Variance = {}\n'.format(var)
        print 'Median Value = {}\n'.format(median)


if __name__ == '__main__':
    args = sys.argv
    args.reverse()
    args.pop()
    args.reverse()
    for arg in args:
        print arg
        data = np.loadtxt(arg, delimiter=',')
        motion = [x[1] for x in data]
        printDataStats(motion)
    