;; -*-lisp-*-
;;
;; p15.lisp

;; P15 (**) Replicate the elements of a list a given number of times.
;; Example:
;; * (repli '(a b c) 3)
;; (A A A B B B C C C)

(defun repli (list n)
  (let ((reslist nil))
    (dolist (element list)
      (dotimes (i n)
        (setf reslist (append reslist (list element)))))
    reslist))
