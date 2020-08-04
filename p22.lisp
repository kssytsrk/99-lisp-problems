;; -*-lisp-*-
;;
;; p22.lisp

;; P22 (*) Create a list containing all integers within a given range.
;; If first argument is smaller (??? they must have meant "bigger")
;; than second, produce a list in decreasing order.
;; Example:
;; * (range 4 9)
;; (4 5 6 7 8 9)

(defun my-range (n k)
  (cond ((eql n k) (list k))
        ((< n k)   (append (list n)
                           (my-range (+ n 1) k)))
        ((> n k)   (append (list n)
                           (my-range (- n 1) k)))))
