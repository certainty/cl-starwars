(in-package #:api)

(defvar *api* (make-instance 'ningle:app))

(setf (ningle:route *api* "/people")
      (lambda (params)
        (declare (ignorable params))
        (success '(((name . "John") (age . 30))
                   ((name . "Mary") (age . 25))))))

(setf (ningle:route *api* "/people/:id")
      (lambda (params)
        (declare (ignorable params))
        (failure "not-found"
                 "The requested person could not be found"
                 :status 404)))

(defun success (object &key (status 200))
  (json-response object :status status))

(defun failure (id description &key (details nil) (status 400))
  (json-response
   `((id . ,id)
     (description . ,description)
     (details . ,details))
   :status status))

(defun json-response (object &key (status 200))
  (setf (lack.response:response-headers ningle:*response*)
        (append (lack.response:response-headers ningle:*response*)
                (list :content-type "application/json")))
  (setf (lack.response:response-status ningle:*response*) status)
  (json:encode-json-to-string object))

(defun run-server ()
  (clack:clackup *api* :server :woo :port 8080))
