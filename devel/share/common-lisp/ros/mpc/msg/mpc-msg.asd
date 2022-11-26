
(cl:in-package :asdf)

(defsystem "mpc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Polynome" :depends-on ("_package_Polynome"))
    (:file "_package_Polynome" :depends-on ("_package"))
  ))