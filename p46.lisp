;;;; -*-lisp-*-
;;;;
;;;; p46.lisp

;;;; P46 (**) Truth tables for logical expressions.
;;;; Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2 (for logical equivalence) which succeed or fail according to the result of their respective operations; e.g. and(A,B) will succeed, if and only if both A and B succeed. Note that A and B can be Prolog goals (not only the constants true and fail).
;;;; A logical expression in two variables can then be written in prefix notation, as in the following example: and(or(A,B),nand(A,B)).
;;;; Now, write a predicate table/3 which prints the truth table of a given logical expression in two variables.
;;;; Example:
;;;; * table(A,B,and(A,or(A,B))).
;;;; true true true
;;;; true fail true
;;;; fail true fail
;;;; fail fail fail

(defun .and (x y)
  (if x y))

(defun .or (x y)
  (if x
    t
    y))

(defun .nand (x y)
  (not (.and x y)))

(defun .nor (x y)
  (not (.or x y)))

(defun .xor (x y)
  (if x
    (not y)
    y))

(defun .equ (x y)
  (if x
    y
    (not y)))

(defun .impl (x y)
  (if (not x)
    t
    y))

(defun to-my-defns (atom)
  (case atom
    (or '.or)
    (and  '.and)
    (nand '.nand)
    (nor  '.nor)
    (xor  '.xor)
    (equ  '.equ)
    (impl '.impl)
    (otherwise atom)))

(defun replace-with-my-defns (sexp)
  (cond ((endp sexp) nil)
        (t (cons (typecase (car sexp)
                   (atom (to-my-defns (car sexp)))
                   (list (replace-with-my-defns (car sexp))))
                 (replace-with-my-defns (cdr sexp))))))

(defun table (a b sexp)
  (loop for v1 in '(t nil)
        with sexp = (replace-with-my-defns sexp)
        do (loop for v2 in '(t nil)
                 do (format t "~&~{~:[fail~;true~]  ~}"
                            (list v1
                                  v2
                                  (eval `(let ((,a ,v1) (,b ,v2))
                                           ,sexp)))))))

