;; -*-lisp-*-
;;
;; p27.lisp

;; P27 (**) Group the elements of a set into disjoint subsets.
;; a) In how many ways can a group of 9 people work in 3 disjoint
;; subgroups of 2, 3 and 4 persons? Write a function that generates
;; all the possibilities and returns them in a list.
;; Example:
;; * (group3 '(aldo beat carla david evi flip gary hugo ida))
;; ( ( (ALDO BEAT) (CARLA DAVID EVI) (FLIP GARY HUGO IDA) )
;; ... )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; b) Generalize the above predicate in a way that we can specify a
;; list of group sizes and the predicate will return a list of groups.
;; Example:
;; * (group '(aldo beat carla david evi flip gary hugo ida) '(2 2 5))
;; ( ( (ALDO BEAT) (CARLA DAVID) (EVI FLIP GARY HUGO IDA) )
;; ... )
;; Note that we do not want permutations of the group members; i.e.
;; ((ALDO BEAT) ...) is the same solution as ((BEAT ALDO) ...).
;; However, we make a difference between ((ALDO BEAT) (CARLA DAVID) ...)
;; and ((CARLA DAVID) (ALDO BEAT) ...).
;; You may find more about this combinatorial problem in a good book on
;; discrete mathematics under the term "multinomial coefficients".

;;; a helper function: non-destructively appends item into nth sublist of list
(defun append-sublist (list n item)
  (cond ((< n 1) (append (list
                          (append (first list)
                                  (list item)))
                         (rest list)))
        (t       (append (list
                          (first list))
                         (append-sublist (rest list)
                                         (1- n)
                                         item)))))


;;; main function to call
;; basically, the idea here is (in one iteration of the outer loop)
;; to go from this:
;; '(() () ())
;; to this:
;; '(((aldo) () ()))
;;   (() (aldo) ())
;;   (() () (aldo))
;; and repeat the cycle for each person in the group, taking the previous
;; result as input (i.e. wipgroups list) and saving the result to resgroups
;; and on the end of an iteration set result as input for the next.

;; probably not the best solution, but that's one I came up with myself!!

;; you can check if it works alright with (length (my-group3 ...)). in my
;; experience it does (aside from some cases where the input is clearly
;; garbage)
(defun my-group3 (group &optional (sublengths '(2 3 4)))
  "Groups the elements of group into disjoint subsets of lengths from
   sublengths list (default values would be '(2 3 4)."
  (let ((wipgroups '())              ; wipgroups - here i get sublists
        (resgroups nil))             ; resgroups - here i push sublists

    (dotimes (i (length sublengths)) ; building a "starting list"
      (push nil wipgroups))
    (setf wipgroups (list wipgroups))

    (dolist (person group)
      (setf resgroups nil)
      (loop for wipgroup in wipgroups
         do (loop for i below (length sublengths)
               do (unless (eql (length (nth i wipgroup))
                             (nth i sublengths))
                    (push (append-sublist wipgroup i person) resgroups))))
      (setf wipgroups resgroups))
    (nreverse resgroups)))
