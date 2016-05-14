import uniboard

class _Getch:
    """Gets a single character from standard input.  Does not echo to the
screen."""
    def __init__(self):
        try:
            self.impl = _GetchWindows()
        except ImportError:
            self.impl = _GetchUnix()

    def __call__(self): return self.impl()


class _GetchUnix:
    def __init__(self):
        import tty, sys

    def __call__(self):
        import sys, tty, termios
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch


class _GetchWindows:
    def __init__(self):
        import msvcrt

    def __call__(self):
        import msvcrt
        return msvcrt.getch()



class ScrollableList(list):
    
    def __init__(self, contents, start=0):
        self.index = start
        self.end = len(contents)-1
        self.extend(contents)
        
    def set_index(self, index):
        self.index = index

    def current(self):
        return self[self.index]
    
    def previous(self):
        self.index -= 1
        if self.index < 0:
            print 'not gonna loop'
        return self[self.index]
    
    def next(self):
        self.index += 1
        if self.index > self.end:
            print 'NOt gonna loop'
        return self[self.index]

class Rover(object):
    def __init__(self):
       self.u = uniboard.Uniboard('/dev/ttyUSB1') 
       wheel_commands = [i*.01 for i in range(-101, 100)]
       self.left = ScrollableList(wheel_commands, start=101)
       self.right = ScrollableList(wheel_commands, start=101)

    def run(self):
        self.u.motor_left(self.left.current())
        self.u.motor_right(self.right.current())
        print 'left {}, right {}'.format(self.left.current(), self.right.current())

    def stop(self):
        self.u.motor_left(0.0)
        self.u.motor_right(0.0)
        print 'stoping'

def main():
    # u = uniboard.Uniboard('/dev/ttyUSB1')
    getch = _Getch()
    rover = Rover()
    running = True
    while running:
        key_press = getch()
        if ord(key_press) == 27:
            running = False
            rover.stop()
        if ord(key_press) == 112:
            rover.right.next()
            rover.run()
        if ord(key_press) == 108:
            rover.right.previous()
            rover.run()
        if ord(key_press) == 111:
            rover.left.next()
            rover.run()
        if ord(key_press) == 107:
            rover.left.previous()
            rover.run()


if __name__ == '__main__':
    main()
