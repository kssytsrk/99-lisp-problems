;;;; -*-lisp-*-
;;;;
;;;; p41.lisp

;;;; P41 (**) A list of Goldbach compositions.
;;;; Given a range of integers by its lower and upper limit, print a list of all even numbers and their Goldbach composition.
;;;; Example:
;;;; * (goldbach-list 9 20)
;;;; 10 = 3 + 7
;;;; 12 = 5 + 7
;;;; 14 = 3 + 11
;;;; 16 = 3 + 13
;;;; 18 = 5 + 13
;;;; 20 = 3 + 17
;;;; In most cases, if an even number is written as the sum of two prime numbers, one of them is very small. Very rarely, the primes are both bigger than say 50. Try to find out how many such cases there are in the range 2..3000.
;;;; Example (for a print limit of 50):
;;;; * (goldbach-list 1 2000 50)
;;;; 992 = 73 + 919
;;;; 1382 = 61 + 1321
;;;; 1856 = 67 + 1789
;;;; 1928 = 61 + 1867

(load "p34.lisp")

(defun my-goldbach-list (lower-limit upper-limit &optional limit)
  (if (oddp lower-limit) (incf lower-limit))
  (loop for i from lower-limit to upper-limit by 2
        with res = nil
        do (setf res (my-goldbach i))
           (if (and res
                    (or (not limit)
                        (< limit (car res))))
             (format t "~a = ~{~a + ~a~}~&" i res))))
