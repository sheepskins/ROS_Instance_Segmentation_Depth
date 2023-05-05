; Auto-generated. Do not edit!


(cl:in-package instance_segmentation_depth-srv)


;//! \htmlinclude Detection-request.msg.html

(cl:defclass <Detection-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Detection-request (<Detection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name instance_segmentation_depth-srv:<Detection-request> is deprecated: use instance_segmentation_depth-srv:Detection-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Detection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader instance_segmentation_depth-srv:image-val is deprecated.  Use instance_segmentation_depth-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection-request>) ostream)
  "Serializes a message object of type '<Detection-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection-request>) istream)
  "Deserializes a message object of type '<Detection-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection-request>)))
  "Returns string type for a service object of type '<Detection-request>"
  "instance_segmentation_depth/DetectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection-request)))
  "Returns string type for a service object of type 'Detection-request"
  "instance_segmentation_depth/DetectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection-request>)))
  "Returns md5sum for a message object of type '<Detection-request>"
  "89253a697464e24247a71577fdb0df85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection-request)))
  "Returns md5sum for a message object of type 'Detection-request"
  "89253a697464e24247a71577fdb0df85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection-request>)))
  "Returns full string definition for message of type '<Detection-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection-request)))
  "Returns full string definition for message of type 'Detection-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude Detection-response.msg.html

(cl:defclass <Detection-response> (roslisp-msg-protocol:ros-message)
  ((detection_result
    :reader detection_result
    :initarg :detection_result
    :type instance_segmentation_depth-msg:Result
    :initform (cl:make-instance 'instance_segmentation_depth-msg:Result)))
)

(cl:defclass Detection-response (<Detection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name instance_segmentation_depth-srv:<Detection-response> is deprecated: use instance_segmentation_depth-srv:Detection-response instead.")))

(cl:ensure-generic-function 'detection_result-val :lambda-list '(m))
(cl:defmethod detection_result-val ((m <Detection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader instance_segmentation_depth-srv:detection_result-val is deprecated.  Use instance_segmentation_depth-srv:detection_result instead.")
  (detection_result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection-response>) ostream)
  "Serializes a message object of type '<Detection-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'detection_result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection-response>) istream)
  "Deserializes a message object of type '<Detection-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'detection_result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection-response>)))
  "Returns string type for a service object of type '<Detection-response>"
  "instance_segmentation_depth/DetectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection-response)))
  "Returns string type for a service object of type 'Detection-response"
  "instance_segmentation_depth/DetectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection-response>)))
  "Returns md5sum for a message object of type '<Detection-response>"
  "89253a697464e24247a71577fdb0df85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection-response)))
  "Returns md5sum for a message object of type 'Detection-response"
  "89253a697464e24247a71577fdb0df85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection-response>)))
  "Returns full string definition for message of type '<Detection-response>"
  (cl:format cl:nil "Result detection_result~%~%================================================================================~%MSG: instance_segmentation_depth/Result~%std_msgs/Header header~%~%# Bounding boxes in pixels~%#sensor_msgs/RegionOfInterest[] boxes~%~%# String class IDs for each bouding box~%string[] class_names~%~%# Float probability scores of the class_id~%#float32[] scores~%~%# Instance masks as Image~%sensor_msgs/Image[] masks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection-response)))
  "Returns full string definition for message of type 'Detection-response"
  (cl:format cl:nil "Result detection_result~%~%================================================================================~%MSG: instance_segmentation_depth/Result~%std_msgs/Header header~%~%# Bounding boxes in pixels~%#sensor_msgs/RegionOfInterest[] boxes~%~%# String class IDs for each bouding box~%string[] class_names~%~%# Float probability scores of the class_id~%#float32[] scores~%~%# Instance masks as Image~%sensor_msgs/Image[] masks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'detection_result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection-response
    (cl:cons ':detection_result (detection_result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Detection)))
  'Detection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Detection)))
  'Detection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection)))
  "Returns string type for a service object of type '<Detection>"
  "instance_segmentation_depth/Detection")