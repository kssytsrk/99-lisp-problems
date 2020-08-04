;; -*-lisp-*-
;;
;; p14.lisp

;; P14 (*) Duplicate the elements of a list.
;; Example:
;; * (dupli '(a b c c d))
;; (A A B B C C C C D D)

(defun dupli (list)
  (let ((reslist nil))
    (dolist (element list)
      (setf reslist (append reslist (list element element)))) ; append two instances of the element
    reslist))
