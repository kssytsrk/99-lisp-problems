;; -*-lisp-*-
;;
;; p07.lisp

;; P07 (**) Flatten a nested list structure.
;; Transform a list, possibly holding lists as elements into a `flat'
;; list by replacing each list with its elements (recursively).
;; Example:
;; * (my-flatten '(a (b (c d) e)))
;; (A B C D E)
;; Hint: Use the predefined functions list and append.

(defun my-flatten (list)
  (cond ((null list) nil)
        ((listp (car list))
         (append (my-flatten (car list))
                 (my-flatten (cdr list))))
        (t
         (append (list (car list))
                 (my-flatten (cdr list))))))
