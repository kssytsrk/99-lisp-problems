;;;; -*-lisp-*-
;;;;
;;;; p70c.lisp

;;;; P70C (*) Count the nodes of a multiway tree
;;;; Write a predicate nnodes/1 which counts the nodes of a given multiway tree.
;;;; Example:
;;;; * nnodes(t(a,[t(f,[])]),N).
;;;; N = 2

(defun nnodes (tree)
  (cond ((null tree) 0)
        (t (1+
            (reduce #'+
                    (map 'list #'nnodes
                         (second tree)))))))
