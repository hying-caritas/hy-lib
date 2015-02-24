(defsystem #:hy-lib
  :version "0.1"
  :description "Huang Ying's Common Lisp Library"
  :depends-on (#:alexandria #:iterate #:uiop #:hy-utils #:cl-ppcre #:cl-fad)
  :components
  ((:file "package")
   (:file "file-system" :depends-on ("package"))))
