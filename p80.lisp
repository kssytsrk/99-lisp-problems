;;;; -*-lisp-*-
;;;;
;;;; p80.lisp

;;;; P80 (***) Conversions
;;;; Write predicates to convert between the different graph representations. With these predicates, all representations are equivalent; i.e. for the following problems you can always pick freely the most convenient form.

;;;; adjacency list - '((b (c g h)) (c (b d f h)) (d (c f)))
;;;; gterm          - '((b c d f g h k) ((b c) (b g) (b h)))
;;;; human-friendly - '((a - b) c (g - h) (d - e))

(defun adjlist-to-gterm (adjlist)
  (loop for element in adjlist
        collect (first element) into nodes
        append (loop for edge in (second element)
                     collect (list (first element) edge))
          into edges
        finally (return
                  (list nodes
                        (remove-duplicates edges
                                           :test-not #'set-difference
                                           :from-end t)))))

(defun gterm-to-adjlist (gterm)
  (loop for node in (first gterm)
        collect (list node
                      (remove-duplicates
                       (apply #'append
                              (mapcar (lambda (list)
                                        (set-difference list (list node)))
                                      (remove-if-not (lambda (list)
                                                       (member node list))
                                                     (second gterm))))))))

(defun humanfr-to-gterm (humanfr)
  (loop for element in humanfr
        with nodes = nil
        with edges = nil
        if (atom element)
          do (adjoin element nodes)
        else
          do (setf nodes (adjoin (first element) nodes))
             (setf nodes (adjoin (third element) nodes))
             (setf edges (adjoin (list (first element) (third element))
                                 edges :test-not #'set-difference))
        finally (return (list nodes edges))))

(defun gterm-to-humanfr (gterm)
  (append
   (loop for edge in (second gterm)
          collect (list (first edge)
                        '-
                        (second edge)))
   (remove-if (lambda (node)
                (member node (second gterm)
                        :test #'member))
              (first gterm))))

(defun adjlist-to-humanfr (adjlist)
  (gterm-to-humanfr (adjlist-to-gterm adjlist)))

(defun humanfr-to-adjlist (humanfr)
  (gterm-to-adjlist (humanfr-to-gterm humanfr)))
