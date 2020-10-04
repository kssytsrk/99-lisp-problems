;; -*-lisp-*-
;;
;; p28.lisp

;; P28 (**) Sorting a list of lists according to length of sublists
;; a) We suppose that a list contains elements that are lists themselves.
;; The objective is to sort the elements of this list according to their
;; length. E.g. short lists first, longer lists later, or vice versa.

;; Example:
;; * (lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;; ((O) (D E) (D E) (M N) (A B C) (F G H) (I J K L))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; b) Again, we suppose that a list contains elements that are lists themselves.
;; But this time the objective is to sort the elements of this list according to
;; their length frequency; i.e., in the default, where sorting is done
;; ascendingly, lists with rare lengths are placed first, others with a more
;; frequent length come later.

;; Example:
;; * (lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;; ((i j k l) (o) (a b c) (f g h) (d e) (d e) (m n))

;; Note that in the above example, the first two lists in the result have length
;; 4 and 1, both lengths appear just once. The third and forth list have length
;; 3 which appears twice (there are two list of this length). And finally, the
;; last three lists have length 2. This is the most frequent length.

(defun my-swap (list a b) ; actually stolen from SO, only works if a<b
  "Swaps two elements (indexes a and b) of list."
  (let ((list-tail (nthcdr a list)))
    (rotatef (car list-tail)
             (elt list-tail (- b a)))
    list))

(defun my-partition (a compare-fun p r)
  "Helper founction for my-quicksort, partitions a list."
  (let ((x (nth r a))
        (i (- p 1)))
    (loop for j from p to (1- r)
       do (when (funcall compare-fun (nth j a) x)
            (incf i)
            (my-swap a i j)))
    (my-swap a (+ i 1) r)
    (1+ i)))

(defun my-quicksort (a &optional (compare-fun #'<=) (p 0) (r (1- (length a))))
  "Quicksorts a list."
  (if (< p r)
      (let ((q (my-partition a compare-fun p r )))
        (my-quicksort a compare-fun p (1- q))
        (my-quicksort a compare-fun (1+ q) r)))
  a)

(defun my-lsort (list)
  "Sorts sublists of list by their lengths."
  (my-quicksort list (lambda (a b) (<= (length a) (length b)))))

(defun my-length-frequencies (list)
  "Helper function for lfsort, returns a hash with frequencies."
  (let ((hash (make-hash-table)))
    (loop for sublist in list
       do (progn
            (unless #1=(gethash (length sublist) hash)
                    (setf #1# 0))
            (incf #1#)))
    hash))

(defun my-lfsort (list)
  "Sorts sublists of list by their lengths' frequencies.
I.e. rarer lengths go first, more common - last."
  (let ((frequencies-hash (my-length-frequencies list)))
    (my-quicksort list (lambda (a b)
                         (<= (gethash (length a) frequencies-hash)
                             (gethash (length b) frequencies-hash))))))
