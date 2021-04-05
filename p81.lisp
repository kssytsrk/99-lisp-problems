;;;; -*-lisp-*-
;;;;
;;;; p81.lisp

;;;; P81 (**) Path from one node to another one
;;;; Write a predicate path(G,A,B,P) to find an acyclic path P from node A to node b in the graph G. The predicate should return all paths via backtracking.

(defun path (adjlist a b)
  (%path adjlist a b (list a)))

(defun %path (adjlist a b excluded)
  (cond ((eq a b) (list (list a)))
        (t (apply #'append
                  (mapcar
                   (lambda (node)
                     (mapcar (lambda (path) (and path (cons a path)))
                             (%path adjlist node b (cons a (cons node excluded)))))
                   (set-difference (cadr (find a adjlist :key #'car)) excluded))))))
