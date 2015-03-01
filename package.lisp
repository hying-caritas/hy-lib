(in-package #:cl-user)

(defpackage #:hy-lib
  (:use :common-lisp :alexandria :iterate :hy-utils :cl-fad :cl-ppcre)
  (:shadowing-import-from :alexandria :copy-file :copy-stream)
  (:import-from :uiop
		;;; pathname
		#:make-pathname*
		#:merge-pathnames*
		#:nil-pathname
		#:*nil-pathname*
		#:with-pathname-defaults
		#:hidden-pathname-p
		#:file-pathname-p
		#:ensure-absolute-pathname
		#:subpathp
		#:enough-pathname
		#:directory-separator-for-host
		#:native-namestring
		#:parse-native-namestring
		#:truename*
		;;; file system
		#:safe-file-write-date
		#:probe-file*
		#:directory-files
		#:subdirectories
		#:resolve-symlinks
		#:ensure-all-directories-exist
		#:rename-file-overwriting-target
		#:concatenate-files
		;;; IO
		#:with-output
		#:output-string
		#:with-input
		#:call-with-null-input
		#:with-null-input
		#:call-with-null-output
		#:with-null-output
		#:finish-outputs
		#:slurp-stream-string
		#:slurp-stream-lines
		#:slurp-stream-line
		#:slurp-stream-forms
		#:slurp-stream-form
		#:read-file-lines
		#:read-file-line
		#:read-file-forms
		#:read-file-form
		#:println
		#:writeln
		;;; OS
		#:os-unix-p
		#:os-windows-p
		#:getenv
		#:getenvp
		#:getenv-pathname
		#:getenv-pathnames
		#:hostname
		#:getcwd
		#:chdir
		#:parse-windows-shortcut
		#:run-program
		#:subprocess-error
		#:subprocess-error-code
		#:subprocess-error-command
		#:subprocess-error-process)
  (:export ;;; pathname from hy-utils
	   #:unix-path
	   #:unix-path-as-directory
	   #:unix-path-string
	   ;;; pathname from cl-fad
           #:directory-pathname-p
           #:pathname-as-directory
           #:pathname-as-file
           #:pathname-directory-pathname
           #:pathname-equal
           #:pathname-parent-directory
           #:pathname-absolute-p
           #:pathname-relative-p
           #:pathname-root-p
           #:canonical-pathname
           #:merge-pathnames-as-directory
           #:merge-pathnames-as-file
	   ;;; pathname from uiop
	   #:make-pathname*
	   #:merge-pathnames*
	   #:nil-pathname
	   #:*nil-pathname*
	   #:with-pathname-defaults
	   #:hidden-pathname-p
	   #:file-pathname-p
	   #:ensure-absolute-pathname
	   #:subpathp
	   #:enough-pathname
	   #:directory-separator-for-host
           ;;; file system from alexandria
	   #:copy-file
	   ;;; file system from cl-fad
           #:delete-directory-and-files
           #:directory-exists-p
           #:file-exists-p
           #:list-directory
           #:walk-directory
	   ;;; file system from uiop
	   #:safe-file-write-date
	   #:probe-file*
	   #:directory-files
	   #:subdirectories
	   #:resolve-symlinks
	   #:ensure-all-directories-exist
	   #:rename-file-overwriting-target
	   #:concatenate-files
	   ;;; file system
	   #:map-pathname-pattern
	   #:list-pathname-pattern
	   #:*path-wild*
	   #:*path-wild-hidden*
	   #:*path-wild-all*
	   ;;; temporary file from cl-fad
           #:open-temporary
           #:with-output-to-temporary-file
           #:with-open-temporary-file
           #:*default-template*
           #:invalid-temporary-pathname-template
           #:cannot-create-temporary-file
	   ;;; IO from alexandria
	   #:copy-stream
	   ;;; IO from uiop
	   #:with-output
	   #:output-string
	   #:with-input
	   #:call-with-null-input
	   #:with-null-input
	   #:call-with-null-output
	   #:with-null-output
	   #:finish-outputs
	   #:slurp-stream-string
	   #:slurp-stream-lines
	   #:slurp-stream-line
	   #:slurp-stream-forms
	   #:slurp-stream-form
	   #:read-file-lines
	   #:read-file-line
	   #:read-file-forms
	   #:read-file-form
	   #:println
	   #:writeln
	   ;;; OS from uiop
	   #:os-unix-p
	   #:os-windows-p
	   #:getenv
	   #:getenvp
	   #:getenv-pathname
	   #:getenv-pathnames
	   #:hostname
	   #:getcwd
	   #:chdir
	   #:parse-windows-shortcut
	   #:run-program
	   #:subprocess-error
	   #:subprocess-error-code
	   #:subprocess-error-command
	   #:subprocess-error-process))
