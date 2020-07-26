;; -*-lisp-*-
;;
;; p01.lisp

;; P01 (*) Find the last box of a list.
;; Example:
;; * (my-last '(a b c d))
;; (D)

(defun my-last (list)
  "Finds the last box of a list."
  (cond ((eq (cdr list) nil) (car list))
        (t (my-last (cdr list)))))
