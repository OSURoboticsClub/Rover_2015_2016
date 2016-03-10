import unittest
from nose import with_setup
import numpy as np
from bunch import Bunch
import rosbag


from src.Flodometry import Flodometry

class TestFlodometry(unittest.TestCase):
    """TestFlodometry"""

    def testUpdate(self):
        self.f = Flodometry()
        bag = rosbag.Bag('2016-03-09-21-03-00.bag')
        for topic, msg, t in bag.read_messages(topics=['/optical_flow']):
            try:
                self.f.update(msg)
            except Exception as ex:
                import IPython; IPython.embed()
        bag.close()
        import IPython; IPython.embed()
        