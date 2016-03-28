import unittest
import numpy as np


def integrate(f, x):
        i = 0
        for n in range(len(f) - 1):
            i += f[n]*(x[n+1]-x[n])
        return i

class TestVelPID(unittest.TestCase):
    def testIntegrate(self):
        err = ([],[])
        for i in np.arange(0,9,0.001):
            err[0].append(i)
            err[1].append(i*2)
        ans = integrate(*err)
        try:
            self.assertAlmostEqual(ans, 81)
        except:
            import IPython; IPython.embed()
