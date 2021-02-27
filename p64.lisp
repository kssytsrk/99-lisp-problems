;;;; -*-lisp-*-
;;;;
;;;; p64.lisp

;;;; P64 (**) Layout a binary tree (1)
;;;; Given a binary tree as the usual Prolog term t(X,L,R) (or nil). As a preparation for drawing the tree, a layout algorithm is required to determine the position of each node in a rectangular grid. Several layout methods are conceivable, one of them is shown in the illustration below.
;;;; In this layout strategy, the position of a node v is obtained by the following two rules:
;;;; x(v) is equal to the position of the node v in the inorder sequence
;;;; y(v) is equal to the depth of the node v in the tree
;;;; In order to store the position of the nodes, we extend the Prolog term representing a node (and its successors) as follows: 
;;;; % nil represents the empty tree (as usual)
;;;; % t(W,X,Y,L,R) represents a (non-empty) binary tree with root W "positioned" at (X,Y), and subtrees L and R
;;;; Write a predicate layout-binary-tree/2 with the following specification: 
;;;; % layout-binary-tree(T,PT) :- PT is the "positioned" binary tree obtained from the binary tree T. (+,?)
;;;; Test your predicate in an appropriate way. 

(defparameter *counter* nil)

(defun layout-binary-tree (tree)
  (let ((*counter* 1))
    (%layout-binary-tree tree 1)))

(defun %layout-binary-tree (tree depth)
  (cond ((null tree) nil)
	(t (let ((left-subtree (%layout-binary-tree (second tree) (1+ depth)))
		 (root-counter *counter*)
		 (right-subtree (%layout-binary-tree (third tree) (1+ depth))))
	     (incf *counter*)
	     (list (first tree)
		   root-counter depth
		   left-subtree	right-subtree)))))
