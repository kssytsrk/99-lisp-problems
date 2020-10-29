;;;; -*-lisp-*-
;;;;
;;;; p31.lisp

;;;; P31 (**) Determine whether a given integer number is prime.
;;;; Example:
;;;; * (is-prime 7)
;;;; T

(defun my-is-prime (number)
  "Checks if a number is prime."
  (cond
    ((<= number 1) nil)
    (t (progn (loop for i from 2 to (sqrt number)
                 do (if (eql (rem number i) 0)
                        (return-from my-is-prime nil)))
              t))))
