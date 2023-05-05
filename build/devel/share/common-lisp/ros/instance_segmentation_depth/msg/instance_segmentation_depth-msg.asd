
(cl:in-package :asdf)

(defsystem "instance_segmentation_depth-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Depth_Result" :depends-on ("_package_Depth_Result"))
    (:file "_package_Depth_Result" :depends-on ("_package"))
    (:file "Result" :depends-on ("_package_Result"))
    (:file "_package_Result" :depends-on ("_package"))
  ))