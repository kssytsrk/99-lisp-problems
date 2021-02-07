;;;; -*-lisp-*-
;;;;
;;;; p55.lisp

;;;; P55 (**) Construct completely balanced binary trees
;;;; In a completely balanced binary tree, the following property holds for every node: The number of nodes in its left subtree and the number of nodes in its right subtree are almost equal, which means their difference is not greater than one.
;;;; Write a function cbal-tree to construct completely balanced binary trees for a given number of nodes. The predicate should generate all solutions via backtracking. Put the letter 'x' as information into all nodes of the tree.
;;;; Example:
;;;; * cbal-tree(4,T).
;;;; T = t(x, t(x, nil, nil), t(x, nil, t(x, nil, nil))) ;
;;;; T = t(x, t(x, nil, nil), t(x, t(x, nil, nil), nil)) ;
;;;; etc......

(defun length-recursive (tree)
  (cond ((null tree) 0)
        (t (+ 1
              (length-recursive (second tree))
              (length-recursive (third  tree))))))

(defun balp (tree)
  (<= (abs (- (length-recursive (second tree))
              (length-recursive (third tree))))
      1))

(defun generate-all (nodes1 nodes2)
  (if (balp (list 'x (first nodes1) (first nodes2)))
      (let (res)
        (dolist (node1 nodes1)
          (setf res
                (nconc res
                       (mapcar (lambda (node2)
                                 (list 'x node1 node2))
                               nodes2))))
        res)))

(defun cbal-tree (n)
  (cond ((= n 0) '(nil))
        ((= n 1) '((x nil nil)))
        (t
         (loop for i from (1- n) downto 0
               with result = nil
               do (setf result (generate-all (cbal-tree i)
                                             (cbal-tree (- (1- n) i))))
               append result))))
