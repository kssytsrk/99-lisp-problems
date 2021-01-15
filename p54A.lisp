;;;; -*-lisp-*-
;;;;
;;;; p54A.lisp

;;;; P54A (*) Check whether a given term represents a binary tree
;;;; Write a predicate istree which returns true if and only if its argument is a list representing a binary tree.
;;;; Example:
;;;; * (istree (a (b nil nil) nil))
;;;; T
;;;; * (istree (a (b nil nil)))
;;;; NIL

(defun treep (lst)
  (or (null lst)
      (and (listp lst)
           (eql (length lst) 3)
           (treep (second lst))
           (treep (third lst)))))
