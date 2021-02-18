;;;; -*-lisp-*-
;;;;
;;;; p62.lisp

;;;; P62 (*) Collect the internal nodes of a binary tree in a list
;;;; An internal node of a binary tree has either one or two non-empty successors. Write a predicate internals/2 to collect them in a list. 
;;;; % internals(T,S) :- S is the list of internal nodes of the binary tree T.

(defun internals (tree)
  (cond ((null tree) nil)
        ((equal (cdr tree) '(nil nil)) nil)
        (t
         (append
          (list (car tree))
          (internals (second tree))
          (internals (third  tree))))))
