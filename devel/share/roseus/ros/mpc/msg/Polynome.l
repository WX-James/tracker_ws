;; Auto-generated. Do not edit!


(when (boundp 'mpc::Polynome)
  (if (not (find-package "MPC"))
    (make-package "MPC"))
  (shadow 'Polynome (find-package "MPC")))
(unless (find-package "MPC::POLYNOME")
  (make-package "MPC::POLYNOME"))

(in-package "ROS")
;;//! \htmlinclude Polynome.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mpc::Polynome
  :super ros::object
  :slots (_start_time _pos_pts _init_v _init_a _t_pts ))

(defmethod mpc::Polynome
  (:init
   (&key
    ((:start_time __start_time) (instance ros::time :init))
    ((:pos_pts __pos_pts) ())
    ((:init_v __init_v) (instance geometry_msgs::Vector3 :init))
    ((:init_a __init_a) (instance geometry_msgs::Vector3 :init))
    ((:t_pts __t_pts) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _start_time __start_time)
   (setq _pos_pts __pos_pts)
   (setq _init_v __init_v)
   (setq _init_a __init_a)
   (setq _t_pts __t_pts)
   self)
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:pos_pts
   (&rest __pos_pts)
   (if (keywordp (car __pos_pts))
       (send* _pos_pts __pos_pts)
     (progn
       (if __pos_pts (setq _pos_pts (car __pos_pts)))
       _pos_pts)))
  (:init_v
   (&rest __init_v)
   (if (keywordp (car __init_v))
       (send* _init_v __init_v)
     (progn
       (if __init_v (setq _init_v (car __init_v)))
       _init_v)))
  (:init_a
   (&rest __init_a)
   (if (keywordp (car __init_a))
       (send* _init_a __init_a)
     (progn
       (if __init_a (setq _init_a (car __init_a)))
       _init_a)))
  (:t_pts
   (&optional __t_pts)
   (if __t_pts (setq _t_pts __t_pts)) _t_pts)
  (:serialization-length
   ()
   (+
    ;; time _start_time
    8
    ;; geometry_msgs/Point[] _pos_pts
    (apply #'+ (send-all _pos_pts :serialization-length)) 4
    ;; geometry_msgs/Vector3 _init_v
    (send _init_v :serialization-length)
    ;; geometry_msgs/Vector3 _init_a
    (send _init_a :serialization-length)
    ;; float64[] _t_pts
    (* 8    (length _t_pts)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;; geometry_msgs/Point[] _pos_pts
     (write-long (length _pos_pts) s)
     (dolist (elem _pos_pts)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3 _init_v
       (send _init_v :serialize s)
     ;; geometry_msgs/Vector3 _init_a
       (send _init_a :serialize s)
     ;; float64[] _t_pts
     (write-long (length _t_pts) s)
     (dotimes (i (length _t_pts))
       (sys::poke (elt _t_pts i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point[] _pos_pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_pts (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _pos_pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3 _init_v
     (send _init_v :deserialize buf ptr-) (incf ptr- (send _init_v :serialization-length))
   ;; geometry_msgs/Vector3 _init_a
     (send _init_a :deserialize buf ptr-) (incf ptr- (send _init_a :serialization-length))
   ;; float64[] _t_pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _t_pts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _t_pts i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get mpc::Polynome :md5sum-) "7ebb28d15fc23e8cb6152349792357d1")
(setf (get mpc::Polynome :datatype-) "mpc/Polynome")
(setf (get mpc::Polynome :definition-)
      "time start_time

geometry_msgs/Point[] pos_pts
geometry_msgs/Vector3 init_v
geometry_msgs/Vector3 init_a

float64[] t_pts

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :mpc/Polynome "7ebb28d15fc23e8cb6152349792357d1")


