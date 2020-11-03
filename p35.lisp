;;;; -*-lisp-*-
;;;;
;;;; p35.lisp

;;;; P35 (**) Determine the prime factors of a given positive integer.
;;;; Construct a flat list containing the prime factors in ascending order.
;;;; Example:
;;;; * (prime-factors 315)
;;;; (3 3 5 7)

(load "~/usr/dev/lisp/99-lisp-problems/p31.lisp")

(defun my-prime-factors (n)
  "Determines the prime factors of a given positive integer and returns them in
  a flat list."
  (loop for i from 2 to n
        if (and (my-is-prime i) (eql 0 (rem n i)))
        do (return (cons i (my-prime-factors (/ n i))))))
