;;;; -*-lisp-*-
;;;;
;;;; p48.lisp

;;;; P48 (**) Truth tables for logical expressions (3).
;;;; Generalize problem P47 in such a way that the logical expression may contain any number of logical variables. Define table/2 in a way that table(List,Expr) prints the truth table for the expression Expr, which contains the logical variables enumerated in List.
;;;; Example:
;;;; * table([A,B,C], A and (B or C) equ A and B or A and C).
;;;; true true true true
;;;; true true fail true
;;;; true fail true true
;;;; true fail fail true
;;;; fail true true true
;;;; fail true fail true
;;;; fail fail true true
;;;; fail fail fail true

(load "p47.lisp")

(defun foo (a &rest stuff)
  `(progn (let ((,a nil))
            ,@stuff)
          (let ((,a t))
            ,@stuff)))

(defun table (list expr)
  (eval (%table list (ops-to-funcs expr))))

(defun %table (list expr)
  (cond ((endp list)
         `(format t "~&~{~:[false~;true ~] ~}" (list a b c ,expr)))
        (t
         (foo (car list)
           (%table (cdr list) expr)))))
