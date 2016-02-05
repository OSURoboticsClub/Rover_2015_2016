
(cl:in-package :asdf)

(defsystem "pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Coords3D" :depends-on ("_package_Coords3D"))
    (:file "_package_Coords3D" :depends-on ("_package"))
  ))