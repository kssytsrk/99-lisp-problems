;; -*-lisp-*-
;;
;; p21.lisp

;; P21 (*) Insert an element at a given position into a list.
;; Example:
;; * (insert-at 'alfa '(a b c d) 2)
;; (A ALFA B C D)

(defun my-insert-at (element list k)
  (cond ((eql k 1) (append (list element)
                           list))
        (t (append (list (car list))
                   (my-insert-at element
                                 (cdr list)
                                 (- k 1))))))
