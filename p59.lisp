;;;; -*-lisp-*-
;;;;
;;;; p59.lisp

;;;; P59 (**) Construct height-balanced binary trees
;;;; In a height-balanced binary tree, the following property holds for every node: The height of its left subtree and the height of its right subtree are almost equal, which means their difference is not greater than one.
;;;; Write a predicate hbal-tree/2 to construct height-balanced binary trees for a given height. The predicate should generate all solutions via backtracking. Put the letter 'x' as information into all nodes of the tree.
;;;; Example:
;;;; * hbal-tree(3,T).
;;;; T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, t(x, nil, nil), t(x, nil, nil))) ;
;;;; T = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, t(x, nil, nil), nil)) ;
;;;; etc......No

(defun all-permutations (fn list)
  (loop for i in list
        append (loop for j in list
                     collect (funcall fn i j))))

(defun hbal-tree (n)
  "Generates a height-balanced tree of height N."
  ;; doesn't work for n>5, this is expected as there's 6561
  ;; possible variations of a height-balanced tree of height 5
  (case n
    (0 '(nil))
    (2 '((x nil (x nil nil))
         (x (x nil nil) nil)
         (x (x nil nil) (x nil nil))))
    (t (all-permutations (lambda (list1 list2)
                           (list 'x list1 list2))
                         (hbal-tree (1- n))))))

;; check the above function with this
(defun tree-height (tree)
  (cond ((eql tree nil) 0)
        (t (1+ (max
                (tree-height (second tree))
                (tree-height (third tree)))))))
