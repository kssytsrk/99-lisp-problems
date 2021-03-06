;;;; -*-lisp-*-
;;;;
;;;; p56.lisp

;;;; P56 (**) Symmetric binary trees
;;;; Let us call a binary tree symmetric if you can draw a vertical line through the root node and then the right subtree is the mirror image of the left subtree. Write a predicate symmetric/1 to check whether a given binary tree is symmetric. Hint: Write a predicate mirror/2 first to check whether one tree is the mirror image of another. We are only interested in the structure, not in the contents of the nodes.

(defun symmetric-p (tree)
  "Check if a binary tree is symmetric."
  (mirror-p (second tree) (third tree)))

(defun mirror-p (node1 node2)
  "Check whether one binary tree is the mirror image of another."
  (cond ((atom node1) (atom node2))
        ((atom node2) (atom node1))
        (t
         (and (mirror-p (third node1)
                            (second node2))
              (mirror-p (second node1)
                            (third node2))))))
