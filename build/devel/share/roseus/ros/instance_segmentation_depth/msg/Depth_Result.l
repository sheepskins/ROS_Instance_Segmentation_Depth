;; Auto-generated. Do not edit!


(when (boundp 'instance_segmentation_depth::Depth_Result)
  (if (not (find-package "INSTANCE_SEGMENTATION_DEPTH"))
    (make-package "INSTANCE_SEGMENTATION_DEPTH"))
  (shadow 'Depth_Result (find-package "INSTANCE_SEGMENTATION_DEPTH")))
(unless (find-package "INSTANCE_SEGMENTATION_DEPTH::DEPTH_RESULT")
  (make-package "INSTANCE_SEGMENTATION_DEPTH::DEPTH_RESULT"))

(in-package "ROS")
;;//! \htmlinclude Depth_Result.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass instance_segmentation_depth::Depth_Result
  :super ros::object
  :slots (_header _class_names _depths _size ))

(defmethod instance_segmentation_depth::Depth_Result
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:class_names __class_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:depths __depths) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:size __size) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _class_names __class_names)
   (setq _depths __depths)
   (setq _size __size)
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
  (:depths
   (&optional __depths)
   (if __depths (setq _depths __depths)) _depths)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _class_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _class_names)) 4
    ;; float32[] _depths
    (* 4    (length _depths)) 4
    ;; float32[] _size
    (* 4    (length _size)) 4
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
     ;; float32[] _depths
     (write-long (length _depths) s)
     (dotimes (i (length _depths))
       (sys::poke (elt _depths i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _size
     (write-long (length _size) s)
     (dotimes (i (length _size))
       (sys::poke (elt _size i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[] _depths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _depths (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _depths i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _size
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _size (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _size i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get instance_segmentation_depth::Depth_Result :md5sum-) "8c769a6dc22d14b3306fcf937008cfe3")
(setf (get instance_segmentation_depth::Depth_Result :datatype-) "instance_segmentation_depth/Depth_Result")
(setf (get instance_segmentation_depth::Depth_Result :definition-)
      "std_msgs/Header header

# String class IDs for each object
string[] class_names

# depths of each object
float32[] depths

# size of each object
float32[] size

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

")



(provide :instance_segmentation_depth/Depth_Result "8c769a6dc22d14b3306fcf937008cfe3")


