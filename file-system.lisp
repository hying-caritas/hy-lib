(in-package :hy-lib)

(defparameter *path-wild* (create-scanner '(:sequence :start-anchor (:inverted-char-class #\.))))
(defparameter *path-wild-hidden* (create-scanner '(:sequence :start-anchor #\.)))
(defparameter *path-wild-all* (create-scanner :everything))

(defun pathname-last-component (pathname)
  (if (directory-pathname-p pathname)
      (lastcar (pathname-directory pathname))
      (file-namestring pathname)))

(defun fod-exists-p (pathname)
  (if (directory-pathname-p pathname)
      (directory-exists-p pathname)
      (file-exists-p pathname)))

(defun map-pathname-pattern (thunk base &rest components)
  (labels ((rec (base components)
	     (let ((component (car components))
		   (remaining (cdr components)))
	       (if (typep component '(or string pathname))
		   (let ((new-base (unix-path base component)))
		     (if remaining
			 (rec new-base remaining)
			 (if (fod-exists-p new-base)
			     (funcall thunk new-base))))
		   (let ((pattern (if (typep component 'function)
				      component
				      (create-scanner component))))
		     (iter (for fod :in (list-directory base :follow-symlinks nil))
			   (if (scan pattern (pathname-last-component fod))
			       (if remaining
				   (rec fod remaining)
				   (funcall thunk fod)))))))))
    (rec (unix-path base) components)))

(defun list-pathname-pattern (base &rest components)
  (let (pathname-list)
    (apply #'map-pathname-pattern (lambda (pathname) (push pathname pathname-list))
	   base components)
    pathname-list))
