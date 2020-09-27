;; -*-lisp-*-
;;
;; p26.lisp

;; P26 (**) Generate the combinations of K distinct objects chosen from
;; the N elements of a list.
;; In how many ways can a committee of 3 be chosen from a group of 12
;; people? We all know that there are C(12,3) = 220 possibilities
;; (C(N,K) denotes the well-known binomial coefficients). For pure
;; mathematicians, this result may be great. But we want to really
;; generate all the possibilities in a list.
;; Example:
;; * (combination 3 '(a b c d e f))
;; ((A B C) (A B D) (A B E) ... )

;; a better solution than one provided below this function
(defun my-combination (count list)
  (cond ((zerop count) '(nil))
        ((null list) nil)
        (t (nconc (mapcar (let ((item (car list)))
                            (lambda (comb)
                              (cons item comb)))
                     (my-combination (1- count) (cdr list)))
                  (my-combination count (cdr list))))))


#|
(defun my-combination (k list)
(let ((reslist list))
(dotimes (i (1- k))
(setf reslist (my-push-each-to-each reslist list)))
reslist))

;; helper function;
;; pushes each element of list1 to each element of list2
;; (checks for duplication)
;; as in (my-push-each-to-each '(a b c d) '(a b c d)) -> '((a b) (a c)...(c d))
(defun my-push-each-to-each (list1 list2)
(let* ((reslist nil)
(templist nil))
(dolist (element list1)
(let ((pos (position (if (listp element)
(car (last element))
element)
list2)))
(if (numberp pos)
(setf templist (nthcdr (1+ pos) list2)))
(setf reslist (append reslist
(my-push-to-each element
templist)))))
reslist))

;; helper function;
;; pushes list1 to each element of list2
;; as in (my-push-to-each '(a) '(b c d)) -> '((a b) (a c) (a d))
(defun my-push-to-each (list1 list2)
(let ((reslist nil))
(unless (listp list1) (setf list1 (list list1)))
(dolist (element list2)
(push (append list1 (list element)) reslist))
(nreverse reslist)))
|#
