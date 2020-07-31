;; -*-lisp-*-
;;
;; p13.lisp

;; P13 (**) Run-length encoding of a list (direct solution).
;; Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.
;; Example:
;; * (encode-direct '(a a a a b c c a a d e e e e))
;; ((4 A) B (2 C) (2 A) D (4 E))

(defun encode-direct (list)
  (let ((reslist nil)
        (pastelm (car list))
        (counter 0))
    (dolist (element list)
      (cond ((eql pastelm element) (incf counter))
            (t (progn
                 (cond ((eql counter 1) (setf reslist (append reslist (list pastelm))))
                       (t (setf reslist (append reslist (list (list counter pastelm))))))
                 (setf counter 1))))
      (setf pastelm element))
    (unless (eql counter 0)
            (cond ((eql counter 1) (setf reslist (append reslist (list pastelm))))
                  (t (setf reslist (append reslist (list (list counter pastelm)))))))
    reslist))
