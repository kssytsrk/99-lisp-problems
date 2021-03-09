;;;; -*-lisp-*-
;;;;
;;;; p69.lisp

;;;; P69 (**) Dotstring representation of binary trees
;;;; We consider again binary trees with nodes that are identified by single
;;;; lower-case letters, as in the example of problem P67. Such a tree can be
;;;; represented by the preorder sequence of its nodes in which dots (.) are
;;;; inserted where an empty subtree (nil) is encountered during the tree
;;;; traversal. For example, the tree shown in problem P67 is represented as
;;;; 'abd..e..c.fg...'. First, try to establish a syntax (BNF or syntax
;;;; diagrams) and then write a predicate tree-dotstring/2 which does the
;;;; conversion in both directions. Use difference lists.

(defun tree-dotstring (tree)
  (typecase tree
    (list (tree-dotstring-out tree))
    (string (tree-dotstring-in tree))))

(defun tree-dotstring-out (tree)
  "Converts a list representation of a tree into its dotstring representation"
  (concatenate 'string
               (string-downcase (symbol-name (first tree)))
               (if (second tree)
                   (tree-dotstring-out (second tree))
                   ".")
               (if (third tree)
                   (tree-dotstring-out (third tree))
                   ".")))

(defun tree-dotstring-in (tree)
  "Converts a dotstring representation of a tree into its list representation"
  (loop for i across tree
        with result = nil
        do (setf result (insert-node-leftmost
                         result
                         (if (char-equal i #\.)
                             nil
                             (intern (string (char-upcase i))))))
        finally (return result)))

;;;; helper functions for tree-dotstring-in
(defun fullp (tree)
  (cond ((null tree) t)
        (t (and (eql (length tree) 3)
                (fullp (second tree))
                (fullp (third tree))))))

(defun insert-node-leftmost (tree node)
  (cond ((null tree) (if node (list node) nil))
        ((eql (length tree) 1) (list (first tree) (if node (list node) nil)))
        ((fullp (second tree)) (list (first tree)
                                     (second tree)
                                     (insert-node-leftmost (third tree) node)))
        (t (if (< 2 (length tree))
               (list (first tree)
                     (insert-node-leftmost (second tree) node)
                     (third tree))
               (list (first tree)
                     (insert-node-leftmost (second tree) node))))))
