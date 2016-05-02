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
class FlowX(object):
    dt = float(1.0)/float(100)
    # Length of state array
    dim_x = 1
    # Initial state [pos, vel]
    x = np.array([[0.0]])
    # State transfrom matrix such that x(t) = F*x(t-1)
    F = np.array([[1]]) 
    # State transfrom noise the variance needs to be tuned when we know how fast we 
    # can accelerate or decelerate.
    Q = np.array([[1E-6]])
    # Initial variance for position set at 0 since we know our starting location
    P = np.array([[0]])
    # Size of measurement array
    dim_z = 1
    # Measurement transform such that z = H*x, [0, mean_motion/actual_vel]
    H = np.array([[26.92]]) 
    # Measurment variance
    R = np.array([[3.32]])
    
class VelLeft(object):
    dt = float(1.0)/float(100)
    # Length of state array
    dim_x = 1
    # Initial state [pos, vel]
    x = np.array([[0.0]])
    # State transfrom matrix such that x(t) = F*x(t-1)
    F = np.array([[1]]) 
    # State transfrom noise the variance needs to be tuned when we know how fast we 
    # can accelerate or decelerate.
    Q = np.array([[1E-6]])
    # Initial variance for position set at 0 since we know our starting location
    P = np.array([[0]])
    # Size of measurement array
    dim_z = 1
    # Measurement transform such that z = H*x, [0, mean_motion/actual_vel]
    H = np.array([[26.92]]) 
    # Measurment variance
    R = np.array([[3.32]])

class VelRight(object):
    dt = float(1.0)/float(100)
    # Length of state array
    dim_x = 1
    # Initial state [pos, vel]
    x = np.array([[0.0]])
    # State transfrom matrix such that x(t) = F*x(t-1)
    F = np.array([[1]]) 
    # State transfrom noise the variance needs to be tuned when we know how fast we 
    # can accelerate or decelerate.
    Q = np.array([[1E-6]])
    # Initial variance for position set at 0 since we know our starting location
    P = np.array([[0]])
    # Size of measurement array
    dim_z = 1
    # Measurement transform such that z = H*x, [0, mean_motion/actual_vel]
    H = np.array([[26.92]]) 
    # Measurment variance
    R = np.array([[3.32]])


flow_x = FlowX()
vel_left = VelLeft()
vel_right = VelRight()
