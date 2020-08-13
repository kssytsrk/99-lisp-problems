;; -*-lisp-*-
;;
;; p26var2.lisp

;; this actually is not the solution for the P26 problem; i misunderstood the
;; task (actually, i undestood it the first time, made the right version
;; and then got a bit confused and made this one)

;; this basically gets all the combinations of elements, including duplicated
;; but reordered ones.

(defun my-combination-nonunique (k list)
  (let ((reslist list))
    (dotimes (i (1- k))
      (setf reslist (my-push-each-to-each-nonunique reslist
                                                    list)))
    reslist))

(defun my-push-each-to-each-nonunique (list1 list2)
  (let ((reslist nil))
    (dolist (element list1)
      (setf reslist (append reslist (my-push-to-each-nonunique element
                                                               list2))))
    reslist))

(defun my-push-to-each-nonunique (list1 list2)
  (let ((reslist nil))
    (unless (listp list1) (setf list1 (list list1)))
    (dolist (element list2)
      (unless (position element list1) (push (append list1
                                                     (list element))
                                             reslist)))
    (reverse reslist)))
