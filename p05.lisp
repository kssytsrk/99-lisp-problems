;; -*-lisp-*-
;;
;; p05.lisp

;; P05 (*) Reverse a list.

(defun my-reverse (list)
  "Reverses a list (without assigning it to the variable)."
  (let ((reslist nil))
    (dolist (element list)
       (push element reslist))
     reslist))
