;;;; -*-lisp-*-
;;;;
;;;; p36.lisp

;;;; P36 (**) Determine the prime factors of a given positive integer (2).
;;;; Construct a list containing the prime factors and their multiplicity.
;;;; Example:
;;;; * (prime-factors-mult 315)
;;;; ((3 2) (5 1) (7 1))
;;;; Hint: The problem is similar to problem P13.

(load "~/usr/dev/lisp/99-lisp-problems/p31.lisp")

(defun my-prime-factors-mult (n)
  (loop with i = 2
        with counter = 0
        when (and (my-is-prime i) (eql 0 (rem n i)))
          do (incf counter)
             (setf n (/ n i))
        else
          when (> counter 0)
            collect (list i counter)
            and do (setf counter 0)
          end
          and do (incf i)
        do (print (list n i))
        while (or (> n 1) (> counter 0))))
