;;;; -*-lisp-*-
;;;;
;;;; p58.lisp

;;;; P58 (**) Generate-and-test paradigm
;;;; Apply the generate-and-test paradigm to construct all symmetric, completely balanced binary trees with a given number of nodes. Example:
;;;; * sym-cbal-trees(5,Ts).
;;;; Ts = [t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil)), t(x, t(x, t(x, nil, nil), nil), t(x, nil, t(x, nil, nil)))]
;;;; How many such trees are there with 57 nodes? Investigate about how many solutions there are for a given number of nodes? What if the number is even? Write an appropriate predicate.

(load "p56")
(load "p55")

;;;; not the best solution, gets reeeally slow on odd n after 20 nodes
;;;; TODO improve later
(defun sym-cbal-trees (n)
  (unless (eql (mod n 2) 0)
      (remove-if-not #'symmetric-p (cbal-tree n))))
