;;;; -*-lisp-*-
;;;;
;;;; p32.lisp

;;;; P32 (**) Determine the greatest common divisor of two positive integer
;;;; numbers.
;;;; Use Euclid's algorithm.
;;;; Example:
;;;; * (gcd 36 63)
;;;; 9

(defun my-gcd (a b)
  "Finds the greatest common divisor of two positive integer numbers."
  (cond
    ((eql b 0) a)
    (t (my-gcd b (rem a b)))))
