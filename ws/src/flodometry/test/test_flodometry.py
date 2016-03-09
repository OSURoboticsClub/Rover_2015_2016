import unittest
from nose import with_setup
import numpy as np
from bunch import Bunch

from src.Flodometry import Flodometry

class TestFlodometry(unittest.TestCase):
    """TestFlodometry"""

    def testUpdate(self):
        self.f = Flodometry()
        motion = Bunch()
        motion.dx = 12
        motion.dy = 12
        self.f.update(motion)
        