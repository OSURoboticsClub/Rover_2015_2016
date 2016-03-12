import unittest
from nose import with_setup
import numpy as np
from bunch import Bunch
import rosbag


from src.Flodometry import Flodometry

class TestFlodometry(unittest.TestCase):
    """TestFlodometry"""

    def testUpdate_one(self):
        self.f = Flodometry()
        bag = rosbag.Bag('2016-03-09-21-01-43.bag')
        for topic, msg, t in bag.read_messages(topics=['/optical_flow']):
            try:
                self.f.update(msg)
            except Exception as ex:
                import IPython; IPython.embed()
        bag.close()
        print self.f.kf.x
        self.assertEquals(True, abs(abs(self.f.kf.x[0])-10) < 1)

    def testUpdate_two(self):
        self.f = Flodometry()
        bag = rosbag.Bag('2016-03-09-21-03-00.bag')
        for topic, msg, t in bag.read_messages(topics=['/optical_flow']):
            try:
                self.f.update(msg)
            except Exception as ex:
                import IPython; IPython.embed()
        bag.close()
        print self.f.kf.x
        self.assertEquals(True, abs(abs(self.f.kf.x[0])-10) < 1)

    def testUpdate_three(self):
        self.f = Flodometry()
        bag = rosbag.Bag('2016-03-09-21-07-21.bag')
        for topic, msg, t in bag.read_messages(topics=['/optical_flow']):
            try:
                self.f.update(msg)
            except Exception as ex:
                import IPython; IPython.embed()
        bag.close()
        print self.f.kf.x
        self.assertEquals(True, abs(abs(self.f.kf.x[0])-10) < 1)
        