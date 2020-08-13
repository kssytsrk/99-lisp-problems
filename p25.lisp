;; -*-lisp-*-
;;
;; p25.lisp

;; P25 (*) Generate a random permutation of the elements of a list.
;; Example:
;; * (rnd-permu '(a b c d e f))
;; (B A D C E F)
;; Hint: Use the solution of problem P23.

(defun my-rnd-permu (list)
  (my-rnd-select list (length list)))
