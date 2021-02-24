;;;; -*-lisp-*-
;;;;
;;;; p63.lisp

;;;; P63 (**) Construct a complete binary tree
;;;; A complete binary tree with height H is defined as follows: The levels 1,2,3,...,H-1 contain the maximum number of nodes (i.e 2**(i-1) at the level i, note that we start counting the levels from 1 at the root). In level H, which may contain less than the maximum possible number of nodes, all the nodes are "left-adjusted". This means that in a levelorder tree traversal all internal nodes come first, the leaves come second, and empty successors (the nil's which are not really nodes!) come last.
;;;; Particularly, complete binary trees are used as data structures (or addressing schemes) for heaps.
;;;; We can assign an address number to each node in a complete binary tree by enumerating the nodes in levelorder, starting at the root with number 1. In doing so, we realize that for every node X with address A the following property holds: The address of X's left and right successors are 2*A and 2*A+1, respectively, supposed the successors do exist. This fact can be used to elegantly construct a complete binary tree structure. Write a predicate complete-binary-tree/2 with the following specification:
;;;; % complete-binary-tree(N,T) :- T is a complete binary tree with N nodes. (+,?)
;;;; Test your predicate in an appropriate way.

(defvar *memoized* nil)

(defun complete-binary-tree (n)
  (loop for i from 1 to n
        with result = nil
        do (setf result
                 (or (cdr (assoc i *memoized*))
                     (insert-node result (list i nil nil))))
           (setf *memoized* (acons i result *memoized*))
        finally (return result)))

(defun tree-height (tree)
  (cond ((eql tree nil) 0)
        (t (1+ (max
                (tree-height (second tree))
                (tree-height (third tree)))))))

(defun fullp (tree)
  (cond ((null tree) t)
        (t (and (eql (tree-height (second tree))
                     (tree-height (third  tree)))
                (fullp (second tree))
                (fullp (third tree))))))

(defun insert-node (tree node)
  (cond ((null tree) node)
        (t (if (and (fullp (second tree))
                    (or (not (eql (tree-height (second tree))
                                  (tree-height (third tree))))
                        (not (fullp (third tree)))))
               (list (first tree)
                     (second tree)
                     (insert-node (third tree) node))
               (list (first tree)
                     (insert-node (second tree) node)
                     (third tree))))))
