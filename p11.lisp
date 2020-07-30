;; -*-lisp-*-
;;
;; p11.lisp

;; P11 (*) Modified run-length encoding.
;; Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
;; Example:
;; * (encode-modified '(a a a a b c c a a d e e e e))
;; ((4 A) B (2 C) (2 A) D (4 E))

;;; loading function 'pack from p09.lisp
(load "p09.lisp")

;;; code for P11. it may be a little bit bad-looking
;;; will fix that once i figure what's not bad-looking
(defun encode-modified (list)
  (let ((reslist nil)
        (pcklist (pack list)))                              ; packed list, result of function in p09.lisp
    (dolist (element pcklist)
      (cond ((eql (length element) 1)                       ; if length of a sublist equals 1
             (push (car element) (cdr (last reslist))))     ; copy the element into the result list
            (t
             (setf reslist
                   (append reslist
                           (list (list (length element)
                                       (car element)))))))) ; else do like in P10
    reslist))
