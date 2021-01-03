;;;; -*-lisp-*-
;;;;
;;;; p47.lisp

;;;; P47 (*) Truth tables for logical expressions (2).
;;;; Continue problem P46 by defining and/2, or/2, etc as being operators. This allows to write the logical expression in the more natural way, as in the example: A and (A or not B). Define operator precedence as usual; i.e. as in Java.
;;;; Example:
;;;; * table(A,B, A and (A or not B)).
;;;; true true true
;;;; true fail true
;;;; fail true fail
;;;; fail fail fail

(load "p46.lisp")

(defvar *ops* '(or and nand nor xor equ impl))

;;;; t or nil
(defun list-length-1-p (list)
  (eql (length list) 1))

(defun ops-to-funcs (opexp)
  "Converts operators to functions (those defined by me) like this:
   '(A and (A or not B)) -> (.and A (.or A (not B)))"
  (cond
    ;; if opexp is null
    ((null opexp) nil)
    ;; if opexp is a single atom
    ((atom opexp) opexp)
    ;; if opexp is a list with 1 element
    ((null (cdr opexp)) (ops-to-funcs (car opexp)))
    ;; if opexp is a list with 2 elements
    ((null (cddr opexp)) opexp)
    ;; if first element of opexp equals 'not
    ;; 'not is different from other operators as it only takes one arg
    ((eql (car opexp) 'not)
     (ops-to-funcs (push (list (car opexp)
                               (cadr opexp))
                         (cddr opexp))))
    ;; if opexp is a list with >2 elements and no 'not at the start
    (t (list (to-my-defns (cadr opexp))
             (ops-to-funcs (car opexp))
             (ops-to-funcs (cddr opexp))))))

(defun table-2 (a b &rest opexp)
  "Prints a truth table, with logical expression written like this:
  (table-2 'a 'b '(A and (A or not B))) -> *truth-table*
  or like this:
  (table-2 'a 'b 'A 'and '(A or not B)) -> *truth-table*"
  (table a b (ops-to-funcs opexp)))
