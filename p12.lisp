;; -*-lisp-*-
;;
;; p12.lisp

;; P12 (**) Decode a run-length encoded list.
;; Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

(defun uncompress (list)
  (let ((reslist nil))
    (dolist (element list)
      (cond ((listp element) ; if > 1 element, append element to reslist (car element) times
             (dotimes (i (car element))
               (setf reslist (append reslist (list (cadr element))))))
            (t (setf reslist (append reslist (list element)))) ; else append element once
            ))
    reslist))
