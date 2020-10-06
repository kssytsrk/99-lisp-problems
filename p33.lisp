;;;; -*-lisp-*-
;;;;
;;;; p33.lisp

;;;; P33 (*) Determine whether two positive integer numbers are coprime.
;;;; Two numbers are coprime if their greatest common divisor equals 1.
;;;; Example:
;;;; * (coprime 35 64)
;;;; T

;;; okay, this is a weird solution (but I like it that way):
;;; in CL, ratios are "canonicalized", i.e. 10 and 20/2 are both read as the
;;; same number. coprime numbers can't be canonicalized, so if you compare
;;; string representations of a canonicalized nubmer ("35/64") and "a/b" (35/64)
;;; they will be the same string, unlike not-coprime numbers ("3/4" and "12/16")
(defun my-coprime-p (a b)
  (equal (format nil "~a" (/ a b))
         (format nil "~a/~a" a b)))
