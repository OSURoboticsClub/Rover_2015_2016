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
        self.pid = []
        for topic, msg, t in bag.read_messages(topics=['/pos_pid_status']):
            self.time.append(t.to_time())
            self.vel.append(msg.current)
            self.out.append(msg.out)
            self.target.append(msg.target)
            self.pid.append(msg.pid_terms)
        bag.close()

    def plotVelocity(self):
        plt.figure()
        plt.plot(self.time, self.vel, label='Velocity')
        plt.plot(self.time, self.out, label='PID Output')
        plt.plot(self.time, self.target, label='PID Target')
        plt.plot(self.time, [x[0] for x in self.pid], label="Proportional Term")
        plt.plot(self.time, [x[1] for x in self.pid], label="Integral Term")
        plt.plot(self.time, [x[2] for x in self.pid], label="Derivative Term")

        plt.axis([min(self.time), max(self.time), min(self.vel), max(self.vel)])
        plt.legend()
        plt.show()




if __name__ == '__main__':
    bag_name = '../pos_bags/2016-04-07-12-28-20.bag'
    t = TunePID()
    t.loadData(bag_name)
    t.plotVelocity()