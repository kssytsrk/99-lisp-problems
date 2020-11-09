;;;; -*-lisp-*-
;;;;
;;;; p39.lisp

;;;; P39 (*) A list of prime numbers.
;;;; Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

(load "p31.lisp")

(defun my-prime-number-list (lower-limit upper-limit)
  "Finds all prime numbers between lower-limit and upper-limit and returns them
   in a list."
  (loop for i from lower-limit to upper-limit
        if (my-is-prime i)
          collect i))
