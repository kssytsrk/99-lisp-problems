;; -*-lisp-*-
;;
;; p24.lisp

;; P24 (*) Lotto: Draw N different random numbers from the set 1..M.
;; The selected numbers shall be returned in a list.
;; Example:
;; * (lotto-select 6 49)
;; (23 1 17 33 21 37)
;; Hint: Combine the solutions of problems P22 and P23.

(load "./p22.lisp")
(load "./p23.lisp")

(defun my-lotto-select (n m)
  (my-rnd-select (my-range 1 m) n))
