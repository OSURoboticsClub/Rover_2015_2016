import numpy as np
from filterpy.common import Q_discrete_white_noise

# Using data from data/srcMotion xconcrete.txt
# Assuming actual velocity of 0.5 m/s
# 581 data points 
# Minimum Value = 23.0
# Maximum Value = 37.0
# Mean Value = 33.2358003442
# Standard Deviation = 1.82292503542
# Variance = 3.32305568475
# Median Value = 34.0
# Radius of rover wheels
r = 0.13
# Wheel base width of rover
b = 1.0

# Constant to transform from cpi to mean_motion/actual_vel
a = 66.48

dt = float(1.0)/float(100)
# Length of state array
dim_x = 6
# Initial state [pos, vel]
x = np.array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
# State transfrom matrix such that x(t) = F*x(t-1)
F = np.array([[1.0, dt, 0.0, 0.0, 0.0, 0.0],
              [0.0, 1.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 1.0, dt, 0.0, 0.0],
              [0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 1.0, dt],
              [0.0, 0.0, 0.0, 0.0, 0.0, 1.0]]) 
# State transfrom noise the variance needs to be tuned when we know how fast we 
# can accelerate or decelerate.
Q = np.array([[0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 1E-6, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 1E-6, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 1E-6]])
# Initial variance for position set at 0.0 since we know our starting location
P = np.array([[0.0, 0.0, 0.0, 0.0, 0.0, 0.0], 
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]])
# Size of measurement array
dim_z = 4

def H(theta):
    return np.array([[0.0, a*np.cos(theta), 0.0, a*np.sin(theta), 0.0, 0.0],
                     [0.0, -a*np.sin(theta), 0.0, a*np.cos(theta), 0.0, 0.0],
                     [0.0, 1.0, 0.0, 0.0, 0.0, 0.0],
                     [0.0, 0.0, 0.0, 0.0, 0.0, b/2]])

R = np.array([[3.32, 0.0, 0.0, 0.0],
              [0.0, 3.32, 0.0, 0.0],
              [0.0, 0.0, 3.32, 0.0],
              [0.0, 0.0, 0.0, 3.32]])
# Measurement transform such that z = H*x, [0, mean_motion/actual_vel]

