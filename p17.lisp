;; -*-lisp-*-
;;
;; p17.lisp

;; P17 (*) Split a list into two parts; the length of the first part is given.
;; Do not use any predefined predicates.
;; Example:
;; * (split '(a b c d e f g h i k) 3)
;; ( (A B C) (D E F G H I K))

(defun my-split (list n)
  (let ((reslist nil)
        (curlist nil))
    (dolist (element list)
      (setf curlist (append curlist (list element)))
      (when (and (eql (length curlist) n) (null reslist))
        (setf reslist (append reslist (list curlist)))
        (setf curlist nil)))
    (unless (null curlist)
      (setf reslist (append reslist (list curlist))))
    reslist))
