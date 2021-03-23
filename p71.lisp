;;;; -*-lisp-*-
;;;;
;;;; p71.lisp

;;;; P71 (*) Determine the internal path length of a tree
;;;; We define the internal path length of a multiway tree as the total sum of
;;;; the path lengths from the root to all nodes of the tree. By this
;;;; definition, the tree in the figure of problem P70 has an internal path
;;;; length of 9. Write a predicate ipl(Tree,IPL) for the flow pattern (+,-).

(defun ipl (tree)
  (%ipl tree 0))

(defun %ipl (tree so-far)
  (reduce #'+
          (map 'list (lambda (n) (%ipl n (1+ so-far)))
               (second tree))
          :initial-value so-far))
