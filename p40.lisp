;;;; -*-lisp-*-
;;;;
;;;; p40.lisp

;;;; P40 (**) Goldbach's conjecture.
;;;; Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers that sum up to a given even integer.
;;;; Example:
;;;; * (goldbach 28)
;;;; (5 23)

(load "p31.lisp")

(defun my-goldbach (n)
  "Calculates Goldbach conjecture."
  (loop for i from 1 to (/ n 2)
        if (and (my-is-prime i) (my-is-prime (- n i)))
          return (list i (- n i))))
