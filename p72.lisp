;;;; -*-lisp-*-
;;;;
;;;; p72.lisp

;;;; P72 (*) Construct the bottom-up order sequence of the tree nodes
;;;; Write a predicate bottom-up(Tree,Seq) which constructs the bottom-up
;;;; sequence of the nodes of the multiway tree Tree. Seq should be a Prolog
;;;; list. What happens if you run your predicate backwords?

(defun bottom-up (tree)
  (unless (endp tree)
    (append (apply #'append (map 'list #'bottom-up (second tree)))
            (list (first tree)))))
