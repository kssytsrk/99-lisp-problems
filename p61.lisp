;;;; -*-lisp-*-
;;;;
;;;; p61.lisp

;;;; P61 (*) Count the leaves of a binary tree
;;;; A leaf is a node with no successors. Write a predicate count-leaves/2 to count them.
;;;; % count-leaves(T,N) :- the binary tree T has N leaves

(defun count-leaves (tree)
  (cond ((null tree) 0)
        ((equal (cdr tree) '(nil nil)) 1)
        (t
         (+ (count-leaves (second tree))
            (count-leaves (third  tree))))))
