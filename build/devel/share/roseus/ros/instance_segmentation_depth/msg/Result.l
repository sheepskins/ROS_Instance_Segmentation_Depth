;; Auto-generated. Do not edit!


(when (boundp 'instance_segmentation_depth::Result)
  (if (not (find-package "INSTANCE_SEGMENTATION_DEPTH"))
    (make-package "INSTANCE_SEGMENTATION_DEPTH"))
  (shadow 'Result (find-package "INSTANCE_SEGMENTATION_DEPTH")))
(unless (find-package "INSTANCE_SEGMENTATION_DEPTH::RESULT")
  (make-package "INSTANCE_SEGMENTATION_DEPTH::RESULT"))

(in-package "ROS")
;;//! \htmlinclude Result.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass instance_segmentation_depth::Result
  :super ros::object
  :slots (_header _class_names _masks ))

(defmethod instance_segmentation_depth::Result
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:class_names __class_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:masks __masks) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _class_names __class_names)
   (setq _masks __masks)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:class_names
   (&optional __class_names)
   (if __class_names (setq _class_names __class_names)) _class_names)
  (:masks
   (&rest __masks)
   (if (keywordp (car __masks))
       (send* _masks __masks)
     (progn
       (if __masks (setq _masks (car __masks)))
       _masks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _class_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _class_names)) 4
    ;; sensor_msgs/Image[] _masks
    (apply #'+ (send-all _masks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _class_names
     (write-long (length _class_names) s)
     (dolist (elem _class_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; sensor_msgs/Image[] _masks
     (write-long (length _masks) s)
     (dolist (elem _masks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _class_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _class_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _class_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; sensor_msgs/Image[] _masks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _masks (let (r) (dotimes (i n) (push (instance sensor_msgs::Image :init) r)) r))
     (dolist (elem- _masks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get instance_segmentation_depth::Result :md5sum-) "14ec78ad8ff0eaa43922915861c4a71f")
(setf (get instance_segmentation_depth::Result :datatype-) "instance_segmentation_depth/Result")
(setf (get instance_segmentation_depth::Result :definition-)
      "std_msgs/Header header

# Bounding boxes in pixels
#sensor_msgs/RegionOfInterest[] boxes

# String class IDs for each bouding box
string[] class_names

# Float probability scores of the class_id
#float32[] scores

# Instance masks as Image
sensor_msgs/Image[] masks

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :instance_segmentation_depth/Result "14ec78ad8ff0eaa43922915861c4a71f")


