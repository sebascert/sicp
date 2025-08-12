(define (adjoin-set x set)
 (define (place-in-order remaining)
  (cond
   ((null? remaining)
    (list x))
   ((< x (car remaining))
    (cons x remaining))
   (else
    (cons (car remaining) (place-in-order (cdr remaining))))))

 (if (element-of-set? x set)
  set
  (place-in-order set)))

(define (element-of-set? x set)
 (cond
  ((null? set)
   #f)
  ((= x (car set))
   #t)
  ((< x (car set))
   #f)
  (else
   (element-of-set? x (cdr set)))))

(define set '(1 2 4))
(test (adjoin-set 1 set) set)
(test (adjoin-set 0 set) '(0 1 2 4))
(test (adjoin-set 3 set) '(1 2 3 4))
(test (adjoin-set 5 set) '(1 2 4 5))
