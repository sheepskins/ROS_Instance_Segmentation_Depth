import cv2
import random
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

def draw_segmentation_map(image, masks, boxes, labels, depths):
    alpha = 1
    beta = 0.6 # transparency for the segmentation map
    gamma = 0 # scalar added to each sum
    bridge = CvBridge()
    for i in range(len(masks)):
        mask = bridge.imgmsg_to_cv2(masks[i], desired_encoding="mono8")
        red_map = np.zeros_like(mask).astype(np.uint8)
        green_map = np.zeros_like(mask).astype(np.uint8)
        blue_map = np.zeros_like(mask).astype(np.uint8)
        # apply a randon color mask to each object
        colour = tuple(np.random.choice(range(256), size=3))
        colour = (int(colour[0]), int(colour[1]), int(colour[2]))
        red_map[mask == 1] = colour[0]
        green_map[mask == 1] = colour[1]
        blue_map[mask == 1]  = colour[2]
        # combine all the masks into a single image
        segmentation_map = np.stack([red_map, green_map, blue_map], 2)
        #convert the original PIL image into NumPy format
        image = np.array(image)
        # convert from RGN to OpenCV BGR format
        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
        # apply mask on the image
        cv2.addWeighted(image, alpha, segmentation_map, beta, gamma, image)
        # draw the bounding boxes around the objects
        cv2.rectangle(image, (boxes[i].x_offset, boxes[i].y_offset), (boxes[i].x_offset+boxes[i].width, boxes[i].y_offset+boxes[i].height), color=colour, 
                      thickness=2)
        # put the label text above the objects
        label_string = labels[i] + " " + np.array2string(depths[i]) + "mm"
        cv2.putText(image , label_string, (boxes[i].x_offset, boxes[i].y_offset-10), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, colour, 
                    thickness=2, lineType=cv2.LINE_AA)
    
    return image