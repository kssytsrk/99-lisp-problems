;;;; -*-lisp-*-
;;;;
;;;; p61a.lisp

;;;; P61A (*) Collect the leaves of a binary tree in a list
;;;; A leaf is a node with no successors. Write a predicate leaves/2 to collect them in a list.
;;;; % leaves(T,S) :- S is the list of all leaves of the binary tree T

(defun leaves (tree)
  (cond ((null tree) nil)
        ((equal (cdr tree) '(nil nil))
         (list (car tree)))
        (t
         (append
          (leaves (second tree))
          (leaves (third  tree))))))
