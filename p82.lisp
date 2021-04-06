;;;; -*-lisp-*-
;;;;
;;;; p82.lisp

;;;; P82 (*) Cycle from a given node
;;;; Write a predicate cycle(G,A,P) to find a closed path (cycle) P starting at a given node A in the graph G. The predicate should return all cycles via backtracking.

(load "p81.lisp")

(defun cycle (adjlist node)
  (cons (list node node)
        (apply #'append
               (mapcar (lambda (connected-node)
                         (mapcar (lambda (path) (cons node path))
                                 (%path adjlist connected-node node nil)))
                       (cadr (find node adjlist :key #'car))))))
