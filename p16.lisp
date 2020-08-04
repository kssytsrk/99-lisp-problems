;; -*-lisp-*-
;;
;; p16.lisp

;; P16 (**) Drop every N'th element from a list.
;; Example:
;; * (drop '(a b c d e f g h i k) 3)
;; (A B D E G H K)

(defun drop (list n)
  (let ((reslist nil)
        (counter 1))
    (dolist (element list)
      (cond ((eql counter n)
             (setf counter 1))
            (t
             (progn
               (setf reslist (append reslist (list element)))
               (incf counter)))))
    reslist))
