
(cl:in-package :asdf)

(defsystem "instance_segmentation_depth-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :instance_segmentation_depth-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
  ))