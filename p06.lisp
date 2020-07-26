;; -*-lisp-*-
;;
;; p06.lisp

;; P06 (*) Find out whether a list is a palindrome.
;; A palindrome can be read forward or backward; e.g. (x a m a x).

(defun my-palindromep (list)
  "Checks if a list is a palindrome."
  (equal list (reverse list)))
