import cv2
import numpy as np

def filters():
    test = 'test'
    test_lower = [40, 120, 0]
    test_upper = [100,255,255] 

    red = "red"
    red_lower = [0, 150, 0]
    red_upper = [10, 255, 255]

    orange = "orange"
    orange_lower = [5,170,0]
    orange_upper = [30,255,255] 

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
    purple_lower = [115, 70, 0]
    purple_upper = [180, 255, 255] 
    color_filters = [purple]#[red, orange, yellow, green, blue, purple]

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
    return {"Lower":lowers, "Upper":uppers, "Filters":color_filters}

def filter_colors(frame=None, show_images=False, verbose=False):
    if frame is None:
        return False
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    # gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    fd = filters()
    lowers = fd["Lower"]
    uppers = fd["Upper"]
    color_filters = fd["Filters"]

    masks = {}
    results = {}
    medians = {}
    smoothed = {}
    kernel = np.ones((15,15), np.float32) / 225

    for color in color_filters:
        lower_color = np.array(lowers[color])
        upper_color = np.array(uppers[color])
        masks[color] = cv2.inRange(hsv, lower_color, upper_color)
        results[color] = cv2.bitwise_and(frame, mask_img, mask=masks[color])
        medians[color] = cv2.medianBlur(results[color], 15)
        smoothed[color] = cv2.filter2D(results[color], -1, kernel)

    edges = cv2.Canny(frame, 80, 200)

    all_images = {"Frame": frame, "Masks": masks, "Results": results, "Colors": color_filters, "Edges": edges, "Median Blur": medians, "Smooth Blur": smoothed }

    if show_images:
        display_images(all_images=all_images)
    return all_images


def display_images(frame=None, masks = None, edge=None, results = None, medians = None, smoothed = None,  all_images=None):
    
    if all_images is not None:
        for image in all_images.keys():
            if isinstance(all_images[image], dict):
                for subimage in all_images[image].keys():
                    cv2.imshow('{} {}'.format(subimage, image), all_images[image][subimage])
            elif isinstance(all_images[image], list):
                for i in range(len(all_images[image])-1):
                    cv2.imshow('{}'.format(image), all_images[image][i])
            elif all_images[image] is None:
                pass
            else:
                cv2.imshow('{}'.format(image), all_images[image])
    else:
        if frame is None:
            cv2.imshow('Frame', frame)
        if masks is not None:
            for key in masks.keys():
                cv2.imshow('{} Mask'.format(key), masks[key])
        
        if results is not None:
            for key in results.keys():
                cv2.imshow('{} Result'.format(key), results[key])
        
        if medians is not None:
            for key in medians.keys():
                cv2.imshow('{} Median'.format(key), medians[key])
        
        if smoothed is not None:
            for key in smoothed.keys():
                cv2.imshow('{} smoothed'.format(key), smoothed[key])
        if edge is not None:
            cv2.imshow('Edges', edge)
    return True

def contour_color(frame=None, show_images=False):
    if frame is None:
        return False
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(gray, 80, 200)
    if show_images:
        cv2.imshow('Base Frame', frame)
        cv2.imshow('Edge Frame', edges)
    return edges

def init(img):
    global mask_img
    mask_img = cv2.imread("mask.pbm")
    mask_img = cv2.resize(mask_img, (img.shape[1], img.shape[0]))
    
def main():
    camera = 1
    cap =cv2.VideoCapture(camera)
    finished = False
    # reads the image mask, stored as mask.pbm
    global mask_img
    mask_img = cv2.imread("mask.pbm")
    # reads a frame... for resizing the image mask to the right size
    _, frame = cap.read()
    mask_img = cv2.resize(mask_img, (frame.shape[1], frame.shape[0]))
    while not finished:
        _, frame = cap.read()
        print(type(frame))
        images = filter_colors(frame=frame, show_images=False, verbose=False)
        #all_images = {"Frame": frame, "Masks": masks, "Results": results, "Colors": color_filters, "Edges": edges, "Median Blur": medians, "Smooth Blur": smoothed }
        #contour_color(frame=images["Smooth Blur"][images["Colors"][0]], show_images=True)
        contour_color(frame=images["Median Blur"][images["Colors"][0]], show_images=True)

        k = cv2.waitKey(5) & 0xFF
        if k == 27:
            break

    cv2.destroyAllWindows()
    cap.release()


if __name__ == "__main__":
    main()












