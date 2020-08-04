;; -*-lisp-*-
;;
;; p19.lisp

;; P19 (**) Rotate a list N places to the left.
;; Examples:
;; * (rotate '(a b c d e f g h) 3)
;; (D E F G H A B C)
;; * (rotate '(a b c d e f g h) -2)
;; (G H A B C D E F)
;; Hint: Use the predefined functions length and append, as well as the result of problem P17.

(load "p17.lisp")

(defun my-rotate (list n)
  (let ((templist nil))
    (cond ((> n 0) (progn
                     (setf templist (my-split list n))
                     (append (cadr templist) (car templist))))
          (t       (progn
                     (setf templist (my-split list (+ (length list) n))))))
    (list (cadr templist) (car templist))))
