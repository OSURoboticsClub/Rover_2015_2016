'''
author:     Stefan Reindel
collaborators:  
date:     1-24
last update:  1-24
'''
import random
import sys
import thread
import threading
import time

def wait():
  time.sleep(random.random())
  return 'W'

def targ():
  for n in range(8):
    wait()
    print 'Thr', wait(), thread.get_ident(), wait(), 'at', wait(), n

tls = threading.local()

class ThreadSafeFile(object):
  def __init__(self, f):
    self.f = f
    self.lock = threading.RLock()
    self.nesting = 0

  def _getlock(self):
    self.lock.acquire()
    self.nesting += 1

  def _droplock(self):
    nesting = self.nesting
    self.nesting = 0
    for i in range(nesting):
      self.lock.release()

  def __getattr__(self, name):
    if name == 'softspace':
      return tls.softspace
    else:
      raise AttributeError(name)

  def __setattr__(self, name, value):
    if name == 'softspace':
      tls.softspace = value
    else:
      return object.__setattr__(self, name, value)

  def write(self, data):
    self._getlock()
    self.f.write(data)
    if data == '\n':
      self._droplock()

# comment the following statement out to get guaranteed chaos;-)
sys.stdout = ThreadSafeFile(sys.stdout)

thrs = []
for i in range(8):
  thrs.append(threading.Thread(target=targ))
print 'Starting'
for t in thrs:
  t.start()
for t in thrs:
  t.join()
print 'Done'