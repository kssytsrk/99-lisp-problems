;;;; -*-lisp-*-
;;;;
;;;; p68.lisp

;;;; P68 (**) Preorder and inorder sequences of binary trees
;;;; We consider binary trees with nodes that are identified by single lower-case letters, as in the example of problem P67.
;;;; a) Write predicates preorder/2 and inorder/2 that construct the preorder and inorder sequence of a given binary tree, respectively. The results should be atoms, e.g. 'abdecfg' for the preorder sequence of the example in problem P67.
;;;; b) Can you use preorder/2 from problem part a) in the reverse direction; i.e. given a preorder sequence, construct a corresponding tree? If not, make the necessary arrangements.

;;;; It'll be ambiguous, so no.

;;;; c) If both the preorder sequence and the inorder sequence of the nodes of a binary tree are given, then the tree is determined unambiguously. Write a predicate pre-in-tree/3 that does the job.
;;;; d) Solve problems a) to c) using difference lists. Cool! Use the predefined predicate time/1 to compare the solutions.
;;;; What happens if the same character appears in more than one node. Try for instance pre-in-tree(aba,baa,T).

;;;; Nothing happens, it returns the normal value - (|a| (|b| NIL NIL) (|a| NIL NIL))

(defun preorder (tree)
  (typecase tree
    (null nil)
    (atom (symbol-name tree))
    (t (concatenate 'string
		    (preorder (first tree))
		    (preorder (second tree))
		    (preorder (third tree))))))

(defun inorder (tree)
  (typecase tree
    (null nil)
    (atom (symbol-name tree))
    (t (concatenate 'string
		    (inorder (second tree))
		    (inorder (first tree))
		    (inorder (third tree))))))

(defun pre-in-tree (preorder inorder)
  (cond
    ((= (length preorder) 0) nil)
    ((equal preorder inorder)
     (list (intern (string (char preorder 0)))
           nil
           (pre-in-tree (subseq preorder 1)
                        (subseq inorder 1))))
    (t (let* ((root-node
		(string (elt preorder 0)))
	      (left-node-in
		(subseq inorder
			0
			(search root-node inorder)))
	      (right-node-in
		(subseq inorder
			(1+ (search root-node inorder))))
	      (left-node-pre
		(subseq preorder
			1
			(1+
			 (apply #'max
                                (loop for char across left-node-in
                                    collect (search (string char)
                                                    preorder))))))
	      (right-node-pre (subseq preorder
				      (1+
                                       (search
                                        (string
                                         (char left-node-pre
                                               (1- (length left-node-pre))))
                                        preorder)))))
	 (list (intern root-node)
	       (pre-in-tree left-node-pre  left-node-in)
	       (pre-in-tree right-node-pre right-node-in))))))
