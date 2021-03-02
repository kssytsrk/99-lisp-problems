;;;; -*-lisp-*-
;;;;
;;;; p67.lisp

;;;; P67 (**) A string representation of binary trees
;;;; Somebody represents binary trees as strings of the following type (see example opposite):
;;;; a(b(d,e),c(,f(g,)))
;;;; a) Write a Prolog predicate which generates this string representation, if the tree is given as usual (as nil or t(X,L,R) term). Then write a predicate which does this inverse; i.e. given the string representation, construct the tree in the usual form. Finally, combine the two predicates in a single predicate tree-string/2 which can be used in both directions.
;;;; b) Write the same predicate tree-string/2 using difference lists and a single predicate tree-dlist/2 which does the conversion between a tree and a difference list in both directions.
;;;; For simplicity, suppose the information in the nodes is a single letter and there are no spaces in the string.

(defun tree-string-a-out (tree)
  (typecase tree
    (atom (if tree
	      (string-downcase (write-to-string tree))))
    (list (cond ((and (null (second tree))
		      (null (third  tree)))
		 (tree-string-a-out (first tree)))
		(t (concatenate 'string
				(tree-string-a-out (first tree))
				"("
				(tree-string-a-out (second tree))
				","
				(tree-string-a-out (third  tree))
				")"))))))

(defun find-comma (string)
  (loop for char across string
	for i from 0
	with skip = 0
	if (eql char #\()
	  do (incf skip)
	else
	  if (eql char #\))
	    do (decf skip)
	else
	  if (and (eql char #\,)
		  (eql skip 0))
	     do (return i)))

(defun tree-string-a-in (string)
  (cond ((eql 0 (length string)) nil)
	(t (let* ((first-element  (string (elt string 0)))
		  (one-element-p  (eql (length string) 1))
		  (string         (unless one-element-p
				    (subseq string
					    (1+ (search "(" string))
						 (search ")" string :from-end t))))
		       (second-element (if string
					   (subseq string
						   0
						   (find-comma string))))
		       (third-element  (if string
					   (subseq string
						   (1+ (length second-element))))))
	     (list (intern (string-upcase first-element))
		   (tree-string-a-in second-element)
		   (tree-string-a-in third-element))))))

(defun tree-string-a (object)
  (typecase object
    (list   (tree-string-a-out object))
    (string (tree-string-a-in  object))))

;; idk how to make this "difference list", and looking up yields just something 
;; similar to a lambda that would append a list to the tree?
(defun tree-string-b (tree)
  nil)
