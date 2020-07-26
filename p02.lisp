;; -*-lisp-*-
;;
;; p02.lisp

;; P02 (*) Find the last but one box of a list.
;; Example:
;; * (my-but-last '(a b c d))
;; (C D)

(defun my-but-last (list)
  "Finds the last but one box of a list."
  (cond ((eq (cdr (cdr list)) nil) list)
        (t (my-but-last (cdr list)))))
