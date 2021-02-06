;;;; -*-lisp-*-
;;;;
;;;; p57.lisp

;;;; P57 (**) Binary search trees (dictionaries)
;;;; Use the predicate add/3, developed in chapter 4 of the course, to write a predicate to construct a binary search tree from a list of integer numbers.
;;;; Example:
;;;; * construct([3,2,5,7,1],T).
;;;; T = t(3, t(2, t(1, nil, nil), nil), t(5, nil, t(7, nil, nil)))
;;;; Then use this predicate to test the solution of the problem P56.
;;;; Example:
;;;; * test-symmetric([5,3,18,1,4,12,21]).
;;;; Yes
;;;; * test-symmetric([3,2,5,7,1]).
;;;; No

(defun add (tree node)
  (cond ((null tree) node)
        ((< (first tree) (first node))
         (list (first tree)
               (second tree)
               (add (third tree) node)))
        (t
         (list (first tree)
               (add (second tree) node)
               (third tree)))))

(defun construct (nums)
  (loop for num in nums
        with result = nil
        do (setf result (add result (list num nil nil)))
        finally (return result)))

(load "p56")

(defun test-symmetric (nums)
  (symmetric-p (construct nums)))

