import sys, os
import rosbag
import numpy as np
import matplotlib.pyplot as plt
RUNTIME = 30.0
WHEEL_RADIUS = 0.5

class FlowCalibrater(object):
    def __init__(self, bag_name, dx, dy):
        self.bag = rosbag.Bag(bag_name)
        linear_dist = np.sqrt(dx**2+dy**2)
        self.linear_vel = linear_dist/RUNTIME
        angular_dist = np.arctan2(dy, dx)
        angular_vel = angular_dist/RUNTIME
        self.left_vel = self.linear_vel - WHEEL_RADIUS*angular_vel
        self.right_vel = self.linear_vel + WHEEL_RADIUS*angular_vel
        

    def calibrate(self):
        squal = []
        dx = []
        dy = []
        flow_time = []
        start_time = None
        optical_flow = self.bag.read_messages(topics=['/optical_flow'])
        for topic, msg, t in optical_flow:
            if start_time == None:
                start_time = t.to_time()
            if t.to_time() - start_time < 27:
                dx.append(msg.dx)
                dy.append(msg.dy)
                flow_time.append(t.to_time()-start_time)
                squal.append(msg.squal)
        avg_dx = np.mean(dx)
        self.flow_h = avg_dx/self.linear_vel
        flow_std = np.std(dx)
        self.flow_var = flow_std**2
        
        enc_time = []
        enc_left = []
        enc_right = []
        encoder_values = self.bag.read_messages(topics=['/encoder_values'])
        start_time = None
        r_enc_left = []
        r_enc_right = []
        for topic, msg, t in encoder_values:
            if start_time == None:
                start_time = t.to_time()
            if t.to_time() - start_time < 27:
                enc_time.append(t.to_time()-start_time)
                enc_left.append(msg.left_rpm)
                enc_right.append(msg.right_rpm)
            elif t.to_time() - start_time > 40:
                r_enc_right.append(msg.right_rpm)
                r_enc_left.append(msg.left_rpm)

        
        avg_enc_left = np.mean(enc_left)
        avg_enc_right = np.mean(enc_right)

        self.left_h = avg_enc_left/self.left_vel
        self.right_h = avg_enc_right/self.right_vel

        enc_left_std = np.std(enc_left)
        enc_right_std = np.std(enc_right)

        self.left_var = enc_left_std**2
        self.right_var = enc_right_std**2
        import IPython; IPython.embed()
        self.print_cfg()

    def print_cfg(self):
        print '\nFlow H = {}'.format(self.flow_h)
        print 'Flow Variance = {}'.format(self.flow_var)
        print 'EncLeft H = {}'.format(self.left_h)
        print 'EncLeft Variance = {}'.format(self.left_var)
        print 'EncRight H = {}'.format(self.right_h)
        print 'EncRight Variance = {}'.format(self.right_var)




def main(bag, dx, dy):
    fc = FlowCalibrater(bag, float(dx), float(dy))
    fc.calibrate()


if __name__ == '__main__':
    main(*sys.argv[1:])