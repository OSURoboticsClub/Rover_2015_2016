import time

class uniboard(object):
    def __init__(self):
        self.x = dict(pos=0, en=False, go=False)
        self.y = dict(pos=0, en=False, go=False)
        self.z = dict(pos=0, en=False, go=False)


    def arm_target(self, axis, target=None):
        print 'Calling Target'
        if target is not None:
            ax = self.__dict__[axis]
            if ax['en'] and ax['go']:
                ax['pos'] = target
                time.sleep(0.25)

    def arm_home(self):
        print 'Calling Home'
        time.sleep(1)
        self.x['pos']=0
        self.y['pos']=0
        self.z['pos']=0

    def arm_en(self, axis, state=None):
        print 'Calling en'
        if state is not None:
            self.__dict__[axis]['en'] = state

    def arm_go(self, axis, state=None):
        print 'calling go'
        if state is not None:
            self.__dict__[axis]['go'] = state

    def arm_current(self, axis):
        print 'calling current'
        return self.__dict__[axis]['pos']
