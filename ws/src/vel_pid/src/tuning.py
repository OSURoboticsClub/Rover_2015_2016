#!/usr/bin/env python

import rosbag
import matplotlib.pyplot as plt
import numpy

class TunePID(object):
    def __init__(self):
        pass

    def loadData(self, bag_name):
        bag = rosbag.Bag(bag_name)
        self.time = []
        self.vel = []
        self.out = []
        self.target = []
        for topic, msg, t in bag.read_messages(topics=['/pid_status']):
            self.time.append(t.to_time())
            self.vel.append(msg.vel)
            self.out.append(msg.out)
            self.target.append(msg.target)
        bag.close()

    def plotVelocity(self):
        plt.figure()
        self.vel = self.applyVariableMeanFilter(self.vel, 10)
        self.time = self.applyVariableMeanFilter(self.time, 10)
        plt.plot(self.time, self.vel, label='Velocity')
        #plt.plot(self.time, self.out, label='PID Output')
        #plt.plot(self.time, self.target, label='PID Target')

        plt.axis([min(self.time), max(self.time), min(self.vel), max(self.vel)])
        plt.legend()
        plt.show()

    def applyVariableMeanFilter(self, data, width):
        filtered = []
        if width/2 != 0:
            for i in range(width/2,len(data)-width/2):
                filtered.append(numpy.mean(data[i-width/2:i+width/2]))
            return filtered
        else:
            return data



if __name__ == '__main__':
    #bag_name = '2016-03-30-18-44-30.bag'
    bag_name = '2016-03-31-11-43-40.bag'
    t = TunePID()
    t.loadData(bag_name)
    t.plotVelocity()