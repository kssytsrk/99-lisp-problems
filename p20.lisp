;; -*-lisp-*-
;;
;; p20.lisp

;; P20 (*) Remove the K'th element from a list.
;; Example:
;; * (remove-at '(a b c d) 2)
;; (A C D)

(defun my-remove-at (list k)
  (cond ((eql k 1) (cdr list))
        (t (append (list (car list)) (my-remove-at (cdr list) (- k 1))))))
