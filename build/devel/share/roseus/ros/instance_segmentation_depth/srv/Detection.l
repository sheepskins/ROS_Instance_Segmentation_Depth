;; Auto-generated. Do not edit!


(when (boundp 'instance_segmentation_depth::Detection)
  (if (not (find-package "INSTANCE_SEGMENTATION_DEPTH"))
    (make-package "INSTANCE_SEGMENTATION_DEPTH"))
  (shadow 'Detection (find-package "INSTANCE_SEGMENTATION_DEPTH")))
(unless (find-package "INSTANCE_SEGMENTATION_DEPTH::DETECTION")
  (make-package "INSTANCE_SEGMENTATION_DEPTH::DETECTION"))
(unless (find-package "INSTANCE_SEGMENTATION_DEPTH::DETECTIONREQUEST")
  (make-package "INSTANCE_SEGMENTATION_DEPTH::DETECTIONREQUEST"))
(unless (find-package "INSTANCE_SEGMENTATION_DEPTH::DETECTIONRESPONSE")
  (make-package "INSTANCE_SEGMENTATION_DEPTH::DETECTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass instance_segmentation_depth::DetectionRequest
  :super ros::object
  :slots (_image ))

(defmethod instance_segmentation_depth::DetectionRequest
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(defclass instance_segmentation_depth::DetectionResponse
  :super ros::object
  :slots (_detection_result ))

(defmethod instance_segmentation_depth::DetectionResponse
  (:init
   (&key
    ((:detection_result __detection_result) (instance instance_segmentation_depth::Result :init))
    )
   (send-super :init)
   (setq _detection_result __detection_result)
   self)
  (:detection_result
   (&rest __detection_result)
   (if (keywordp (car __detection_result))
       (send* _detection_result __detection_result)
     (progn
       (if __detection_result (setq _detection_result (car __detection_result)))
       _detection_result)))
  (:serialization-length
   ()
   (+
    ;; instance_segmentation_depth/Result _detection_result
    (send _detection_result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; instance_segmentation_depth/Result _detection_result
       (send _detection_result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; instance_segmentation_depth/Result _detection_result
     (send _detection_result :deserialize buf ptr-) (incf ptr- (send _detection_result :serialization-length))
   ;;
   self)
  )

(defclass instance_segmentation_depth::Detection
  :super ros::object
  :slots ())

(setf (get instance_segmentation_depth::Detection :md5sum-) "89253a697464e24247a71577fdb0df85")
(setf (get instance_segmentation_depth::Detection :datatype-) "instance_segmentation_depth/Detection")
(setf (get instance_segmentation_depth::Detection :request) instance_segmentation_depth::DetectionRequest)
(setf (get instance_segmentation_depth::Detection :response) instance_segmentation_depth::DetectionResponse)

(defmethod instance_segmentation_depth::DetectionRequest
  (:response () (instance instance_segmentation_depth::DetectionResponse :init)))

(setf (get instance_segmentation_depth::DetectionRequest :md5sum-) "89253a697464e24247a71577fdb0df85")
(setf (get instance_segmentation_depth::DetectionRequest :datatype-) "instance_segmentation_depth/DetectionRequest")
(setf (get instance_segmentation_depth::DetectionRequest :definition-)
      "sensor_msgs/Image image

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
---
Result detection_result

================================================================================
MSG: instance_segmentation_depth/Result
std_msgs/Header header

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

(setf (get instance_segmentation_depth::DetectionResponse :md5sum-) "89253a697464e24247a71577fdb0df85")
(setf (get instance_segmentation_depth::DetectionResponse :datatype-) "instance_segmentation_depth/DetectionResponse")
(setf (get instance_segmentation_depth::DetectionResponse :definition-)
      "sensor_msgs/Image image

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
---
Result detection_result

================================================================================
MSG: instance_segmentation_depth/Result
std_msgs/Header header

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



(provide :instance_segmentation_depth/Detection "89253a697464e24247a71577fdb0df85")


