;;;; -*-lisp-*-
;;;;
;;;; p70b.lisp

;;;; P70B (*) Check whether a given term represents a multiway tree
;;;; Write a predicate istree/1 which succeeds if and only if its argument is a
;;;; Prolog term representing a multiway tree.
;;;; Example:
;;;; * istree(t(a,[t(f,[t(g,[])]),t(c,[]),t(b,[t(d,[]),t(e,[])])])).
;;;; Yes

;;;; a multiway tree - (a #((f #((g #()))) (c #()) (b #((d #()) (e #(nil))))))

(defun multreep (tree)
  (cond ((eql (length tree) 0))
        ((and (eql (length tree) 2)
               (arrayp (second tree))
               (every #'multreep (second tree))))))
