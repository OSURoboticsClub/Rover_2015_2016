'''
author:			Stefan Reindel
collaborators:	
date:			1-24
last update:	1-24
'''
import os, sys, time, datetime
import thread
import threading


class ThreadSafeFile(object):
    '''
    Source:
    http://stackoverflow.com/questions/3029816/how-do-i-get-a-thread-safe-print-in-python-2-6
    '''
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

class Logger():
    def __init__(self):
        sys.stdout = ThreadSafeFile(sys.stdout)

    def clear(self):
        """
        clear: This function adds a bunch of new lines to the console window.
        		This allows for easier reading of certain log statements.
        """
        os.system('clear')

    def log(self, text=""):
        """
        log: This function logs a wanted formatted output.
        text: This parameter is the text you want to log.
        """
        time_stamp = time.time()
        time_stamp =datetime.datetime.fromtimestamp(time_stamp).strftime('%Y-%m-%d %H:%M:%S')
        print "[LOG] {} - {}".format(time_stamp, str(text))
    def debug(self, text=""):
        """
        log: This function logs a wanted formatted output.
        text: This parameter is the text you want to log.
        """
        time_stamp = time.time()
        time_stamp =datetime.datetime.fromtimestamp(time_stamp).strftime('%Y-%m-%d %H:%M:%S')
        print "[DEBUG] {} - {}".format(time_stamp, str(text))
    def error(self, text=""):
        """
        log: This function logs a wanted formatted output.
        text: This parameter is the text you want to log.
        """
        time_stamp = time.time()
        time_stamp =datetime.datetime.fromtimestamp(time_stamp).strftime('%Y-%m-%d %H:%M:%S')
        print "[ERROR] {} - {}".format(time_stamp, str(text))
    def fatal_error(self, text=""):
        """
        log: This function logs a wanted formatted output.
        text: This parameter is the text you want to log.
        """
        time_stamp = time.time()
        time_stamp =datetime.datetime.fromtimestamp(time_stamp).strftime('%Y-%m-%d %H:%M:%S')
        print "[FATAL ERROR] {} - {}".format(time_stamp, str(text))