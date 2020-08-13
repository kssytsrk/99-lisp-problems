;; -*-lisp-*-
;;
;; p23.lisp

;; P23 (**) Extract a given number of randomly selected elements from a list.
;; The selected items shall be returned in a list.
;; Example:
;; * (rnd-select '(a b c d e f g h) 3)
;; (E D A)
;; Hint: Use the built-in random number generator and the result of problem P20.

(load "~/usr/dev/lisp/99-lisp-problems/p20.lisp")

(defun my-rnd-select (list n)
  (let ((reslist nil))
    (dotimes (i n)
      (let ((rnum (random (length list))))
        (push (nth rnum list) reslist)
        (setf list (my-remove-at list (1+ rnum)))))
    reslist))
