;;;; -*-lisp-*-
;;;;
;;;; p70.lisp

;;;; P70 (**) Tree construction from a node string
;;;; We suppose that the nodes of a multiway tree contain single characters. In
;;;; the depth-first order sequence of its nodes, a special character ^ has
;;;; been inserted whenever, during the tree traversal, the move is a backtrack
;;;; to the previous level.
;;;; By this rule, the tree in the figure opposite is represented as: afg^^c^bd^e^^^
;;;; Define the syntax of the string and write a predicate tree(String,Tree) to
;;;; construct the Tree when the String is given. Work with atoms (instead of
;;;; strings). Make your predicate work in both directions.

;;;; afg^^c^bd^e^^^
;;;; to
;;;; (a #((f #((g #()))) (c #()) (b #((d #()) (e #())))))

(defun string-to-tree (string)
  (cond ((or (eql (length string) 0)
             (eql (elt string 0) #\^))
         (values nil ""))
        (t (values
            (list (intern (string-upcase (string (elt string 0))))
                  (progn
                    (setf string (subseq-no-error string 1))
                    (apply #'vector
                           (reverse
                            (let (result)
                              (loop
                                (when (or (eql (length string) 0)
                                          (eql (elt string 0) #\^))
                                  (return result))
                                (multiple-value-bind (res str)
                                    (string-to-tree string)
                                  (push res result)
                                  (setf string str))))))))
            (subseq-no-error string 1)))))

(defun subseq-no-error (sequence start)
  (handler-case (subseq sequence start)
    (t () "")))

(defun tree-to-string (tree)
  (concatenate 'string
               (string-downcase (symbol-name (first tree)))
               (loop for node across (second tree)
                     with result = ""
                     do (setf result
                              (concatenate 'string
                                           result
                                           (tree-to-string node)))
                     finally (return result))
               "^"))
