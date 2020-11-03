;;;; -*-lisp-*-
;;;;
;;;; p37.lisp

;;;; P37 (**) Calculate Euler's totient function phi(m) (improved).
;;;; See problem P34 for the definition of Euler's totient function. If the list of the prime factors of a number m is known in the form of problem P36 then the function phi(m) can be efficiently calculated as follows: Let ((p1 m1) (p2 m2) (p3 m3) ...) be the list of prime factors (and their multiplicities) of a given number m. Then phi(m) can be calculated with the following formula:
;;;; phi(m) = (p1 - 1) * p1 ** (m1 - 1) + (p2 - 1) * p2 ** (m2 - 1) + (p3 - 1) * p3 ** (m3 - 1) + ...
;;;; Note that a ** b stands for the b'th power of a.

(load "p36.lisp")

;;; the formula doesn't really work on some inputs; not sure why (yet)
(defun my-phi (m)
  (let ((prime-list (my-prime-factors-mult m)))
    (reduce #'(lambda (past pnmn)
                (let ((pn (car pnmn))
                      (mn (cadr pnmn)))
                  (+ past
                           (* (- pn 1)
                              (expt pn (- mn 1))))))
            prime-list
            :initial-value 0)))
