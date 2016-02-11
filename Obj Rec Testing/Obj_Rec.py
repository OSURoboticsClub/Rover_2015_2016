import cv2
import numpy as np

camera = 0
cap =cv2.VideoCapture(camera)

while True:
    _, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    test = 'test'
    test_lower = [40, 120, 0]
    test_upper = [100,255,255] 

    red = "red"
    red_lower = [0, 150, 0]
    red_upper = [10, 255, 255]

    orange = "orange"
    orange_lower = [10,170,0]
    orange_upper = [20,255,255] 

    yellow = "yellow"
    yellow_lower = [20,220,0]
    yellow_upper = [50,255,255] 

    green = "green"
    green_lower = [40, 120, 0]
    green_upper = [100,255,255]

    blue = 'blue'
    blue_lower = [100,150,0]
    blue_upper = [120,255,255] 

    purple = 'purple'
    purple_lower = [120, 100, 0]
    purple_upper = [160, 255, 255] 
    color_filters = [red, orange, yellow, green, blue, purple]

    lowers = {}
    #lowers[test] = test_lower
    #'''
    lowers[red] = red_lower
    lowers[orange] = orange_lower
    lowers[yellow] = yellow_lower
    lowers[green] = green_lower
    lowers[blue] = blue_lower
    lowers[purple] = purple_lower
    #'''

    uppers = {}
    #uppers[test] = test_upper
    #'''
    uppers[red] = red_upper
    uppers[orange] = orange_upper
    uppers[yellow] = yellow_upper
    uppers[green] = green_upper
    uppers[blue] = blue_upper
    uppers[purple] = purple_upper
    #'''

    masks = {}
    results = {}
    medians = {}
    kernel = np.ones((15,15), np.float32) / 225
    color_filters = sorted(lowers.keys())
    for color in color_filters:
        #print color
        lower_color = np.array(lowers[color])
        upper_color = np.array(uppers[color])
        masks[color] = cv2.inRange(hsv, lower_color, upper_color)
        results[color] = cv2.bitwise_and(frame, frame, mask=masks[color])
        medians[color] = cv2.medianBlur(results[color], 15)


    edges = cv2.Canny(frame, 80, 200)

    cv2.imshow('Frame', frame)
    #for color in masks.keys():
        #cv2.imshow('{} Mask'.format(color), masks[color])
        #cv2.imshow('{} Result'.format(color), results[color])
        #v2.imshow('{} Median'.format(color), medians[color])
    cv2.imshow('Edges', edges)

    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break

cv2.destroyAllWindows()
cap.release()














