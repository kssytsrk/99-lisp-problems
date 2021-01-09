;;;; -*-lisp-*-
;;;;
;;;; p49.lisp

;;;; P49 (**) Gray code.
;;;; An n-bit Gray code is a sequence of n-bit strings constructed according to certain rules. For example,
;;;; n = 1: C(1) = ['0','1'].
;;;; n = 2: C(2) = ['00','01','11','10'].
;;;; n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
;;;; Find out the construction rules and write a predicate with the following specification:
;;;; % gray(N,C) :- C is the N-bit Gray code
;;;; Can you apply the method of "result caching" in order to make the predicate more efficient, when it is to be used repeatedly?

;;;; implemented c(n) for now, idk what is gray(n,c)
(defun prepend-n (n lst)
  (mapcar (lambda (str) (concatenate 'string n str)) lst))

(defvar *res-cache* nil
  "Result caches.")

(defun c (n &key (use-cache t))
  (cond ((<= n 0)  '(""))
        ((eql n 1) '("0" "1"))
        ((and use-cache (cdr (assoc n *res-cache*))))
        (t (let* ((recres (c (1- n)))
                  (res (append (prepend-n "0" recres)
                               (prepend-n "1" (reverse recres)))))
             (setf *res-cache* (acons n res *res-cache*))
             res))))
