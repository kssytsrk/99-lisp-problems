;; -*-lisp-*-
;;
;; p10.lisp

;; P10 (*) Run-length encoding of a list.
;; Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
;; Example:
;; * (encode '(a a a a b c c a a d e e e e))
;; ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))

;;; loading function 'pack from p09.lisp
(load "p09.lisp")

;;; code for P10
(defun encode (list)
  (let ((reslist nil)
        (pcklist (pack list))) ; packed list, result of function in p09.lisp
    (dolist (element pcklist)
      ;; appends a list of length of packed sublist + first element of packed sublist
      (setf reslist (append reslist (list (list (length element) (car element))))))
    reslist))
