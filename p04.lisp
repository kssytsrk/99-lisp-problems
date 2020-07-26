;; -*-lisp-*-
;;
;; p04.lisp

;; P04 (*) Find the number of elements of a list.

(defun my-length (list)
  "Finds the number of elements of a list."
  (cond ((eq (car list) nil) 0)
        ((eq (cdr list) nil) 1)
        (t (+ 1 (my-length (cdr list))))))
