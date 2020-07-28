;; -*-lisp-*-
;;
;; p08.lisp

;; P08 (**) Eliminate consecutive duplicates of list elements.
;; If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
;; Example:
;; * (compress '(a a a a b c c a a d e e e e))
;; (A B C A D E)

(defun my-compress (list)
  (cond ((null list) nil)
        ((null (cdr list)) list)
        ((eql (car list) (cadr list)) (my-compress (cdr list))) ; if car equals cadr, return my-compress cdr
        (t (append (list (car list)) (my-compress (cdr list)))))) ; else append car to my-compress cdr
