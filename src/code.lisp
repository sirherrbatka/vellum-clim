(cl:in-package #:vellum-clim)


(defun show-data-frame (clim-stream data-frame)
  (vellum:with-table (data-frame)
    (clim:formatting-table (clim-stream
                            :multiple-columns t
                            :y-spacing 20
                            :x-spacing 20)
      (iter:iterate
        (iter:with header = (vellum:header))
        (iter:for i from 0 below (vellum:column-count data-frame))
        (iter:for name = (or (ignore-errors (vellum.header:index-to-name header i))
                              i))
        (clim:formatting-column (clim-stream)
          (clim:surrounding-output-with-border (clim-stream
                                                :shape :underline)
            (clim:formatting-cell (clim-stream)
              (princ name clim-stream)))
          (vellum:transform data-frame
            (vellum:bind-row ()
              (clim:formatting-cell (clim-stream)
                (print (vellum:rr i) clim-stream)))
            :in-place t))))))


(clim:define-application-frame table-view ()
  ((%dataframe :initarg :dataframe :reader dataframe))
  (:pane :application
   :scroll-bars t
   :display-function (lambda (frame pane)
                       (show-data-frame pane (dataframe frame)))))


(defmethod vellum:show ((as (eql :clim))
                       (table vellum.table:fundamental-table)
                       &key)
  (clim:run-frame-top-level
   (clim:make-application-frame
    'table-view
    :dataframe table)))
