#!/usr/bin/env python

'''File contains a class for implementing a Haar Cascade detector,
including queue functionality and visualization features.'''

from collections import deque
import numpy as np
import cv2


class HaarDetector(object):
    def __init__(self, cascade_dir):
        '''A class for doing a Haar Cascade detection. The class
        is initialized with a path to a cascade.xml file. The
        class has queue functionality (currently unused), and
        visualization features..'''
        self.cascade = cv2.CascadeClassifier(cascade_dir)
        self.queue = deque()
        self.queue_size = 0
        self.queue_at_max = False
        self.min_matches = 0
        self.img = None
    
    def set_cascade(self, cascade_dir):
        '''Set the Haar cascade to use by specifying the cascade
        directory.'''
        self.cascade = cv2.CascadeClassifier(cascade_dir)
        
    def set_queue_size(self, size):
        '''Set the maximum size of the queue (currently not 
        used).'''
        self.queue_size = size
    
    def get_img(self):
        '''Retrieve the image passed to the Haar Detector. If the
        detector found a sample, the image will include a rectangle
        around the detected object.'''
        return self.img
    
    def detect(self, img):
        '''Main detection function. This function detects objects in
        an BGR image using the specified cascade.'''
        self.img = img
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        # attempts to detect objects in the image
        obj = self.cascade.detectMultiScale(gray, 1.1, 5,
         cv2.CASCADE_FIND_BIGGEST_OBJECT, (16, 32))
        
        # places the object in the queue, if needed
        self.queue.append(obj)
        if self.queue_at_max:
            self.queue.popleft()
        elif len(self.queue) is self.queue_size:
            self.queue_at_max = True
            self.queue.popleft()
        
        # only accept object if only one object found
        # removes cases where two or more objects are
        # found, since that would not make sense in the
        # context of the competition
        if len(obj) is 1:
            x,y,w,h = obj[0]
            center = (x + (w//2), y + (h//2))
            matches = 0
            # Compares the current detected object with ones
            # already existing in the queue. The object is 
            # counted as a match if the distances between centers
            # is less than a threshold. If the number of matches
            # exceeds a threshold value, then the object is
            # accepted and returned.
            for cache in self.queue:
                for (x2, y2, w2, h2) in cache:
                    center2 = (x2 + (w2//2), y2 + (h2//2))
                    score = (center2[0] - center[0])**2 + \
                            (center2[1] - center[1])**2
                    if score < 200:
                        matches += 1
            if matches >= self.min_matches:
                cv2.rectangle(self.img,(x,y), (x+w, y+h), (0,0,255))  
                return center
        return None
    
    # some static methods to make the class compatible with
    # existing     
    @staticmethod
    def initialize_precached():
        '''Creates a HaarDetector instance that can be accessed
        anywhere from the module. The cascade for the precached
        sample is used.'''
        global precache_detector 
        precache_detector = HaarDetector("cascade.xml")
        
    @staticmethod
    def detect_precached(img):
        '''Detects the precached sample using the global
        HaarDetector instance.'''
        return precache_detector.detect(img)
    
    @staticmethod
    def get_image():
        '''Gets an image from the global instance of 
        HaarDetector.'''
        return precache_detector.get_img()

        
# If run as a standalone script, opens up the first
# available camera and shows where the precache sample
# is detected.
if __name__ == "__main__":
    HaarDetector.initialize_precached()
    win = cv2.namedWindow("window", cv2.WINDOW_AUTOSIZE)
    cap = cv2.VideoCapture(0)
    
    while True:
        val, img = cap.read()
        center = HaarDetector.detect_precached(img)
        
        if center is not None:
            print("x: %i, y: %i" % (center[0], center[1]))
            
        else:
            print("No object found")
        cv2.imshow("window", precache_detector.get_img())
        if cv2.waitKey(30) & 0xFF == 27:
            break
