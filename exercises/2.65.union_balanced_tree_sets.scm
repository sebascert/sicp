(define (entry tree)
 (car tree))

(define (left-branch tree)
 (cadr tree))

(define (list->tree elements)
 (define (partial-tree elts n)
  (if (= n 0)
   (cons '() elts)
   (let ((left-size (quotient (- n 1) 2)))
    (let ((left-result (partial-tree elts left-size)))
     (let ((left-tree (car left-result))
           (non-left-elts (cdr left-result))
           (right-size (- n (+ left-size 1))))
      (let ((this-entry (car non-left-elts))
            (right-result (partial-tree (cdr non-left-elts) right-size)))
       (let ((right-tree (car right-result))
             (remaining-elts (cdr right-result)))
        (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))

 (car (partial-tree elements (length elements))))

(define (make-tree entry left right)
 (list entry left right))

(define (right-branch tree)
 (caddr tree))

; from exercise 2.62
(define (merge-sorted-lists list1 list2)
 (cond
  ((null? list1)
   list2)
  ((null? list2)
   list1)
  (else
   (let ((e1 (car list1))
         (e2 (car list2)))
    (cond
     ((< e1 e2)
      (cons e1 (union-set (cdr list1) list2)))
     ((> e1 e2)
      (cons e2 (union-set list1 (cdr list2))))
     (else
      (cons e1 (union-set (cdr list1) (cdr list2)))))))))

(define (tree->list-2 tree)
 (define (copy-to-list tree result-list)
  (if (null? tree)
   result-list
   (copy-to-list
    (left-branch tree)
    (cons (entry tree) (copy-to-list (right-branch tree) result-list)))))

 (copy-to-list tree '()))

(define (union-set set1 set2)
 (list->tree (merge-sorted-lists (tree->list set1) (tree->list set2))))
