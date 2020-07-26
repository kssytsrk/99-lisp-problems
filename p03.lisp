;; -*-lisp-*-
;;
;; p03.lisp

;; P03 (*) Find the K'th element of a list.
;; The first element in the list is number 1.
;; Example:
;; * (element-at '(a b c d e) 3)
;; C

(defun element-at (list k)
  "Finds the k'th element of a list.
   The first element in the list is number 1."
  (cond ((<= k 1) (car list))
        ((> (length list) 1) (element-at (cdr list) (- k 1)))))
