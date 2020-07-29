;; -*-lisp-*-
;;
;; p09.lisp

;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;; If a list contains repeated elements they should be placed in separate sublists.
;; Example:
;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))

;; this code might be amazingly bad, but I can't come up
;; with anything better just yet;
(defun pack (list)
  (let ((reslist nil)
        (curlist nil)) ; curlist collects sublists for appending into reslist
    (dolist (element list)
      (cond ((eql element (car curlist)) (push element curlist)) ; if element equals to the current sublist's
                                                                 ; elements, push it into the current sublist
            (t ; else append current sublist into reslist, then clear it and push the current element
             (progn
               (unless (null curlist) (setf reslist (append reslist (list curlist))))
               (setf curlist nil)
               (push element curlist)))))
    (unless (null curlist) (setf reslist (append reslist (list curlist)))) ; appending the last sublist
    reslist))
