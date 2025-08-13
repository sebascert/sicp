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

(define (union-set set1 set2)
 (cond
  ((null? set1)
   set2)
  ((null? set2)
   set1)
  (else
   (let ((e1 (car set1))
         (e2 (car set2)))
    (cond
     ((< e1 e2)
      (cons e1 (union-set (cdr set1) set2)))
     ((> e1 e2)
      (cons e2 (union-set set1 (cdr set2))))
     (else
      (cons e1 (union-set (cdr set1) (cdr set2)))))))))

(test (union-set '(1 2 3) '(3 4 5)) '(1 2 3 4 5))
(test (union-set nil '(1 2 3)) '(1 2 3))
(test (union-set '(1 2 3) nil) '(1 2 3))
(test (union-set '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))
(test (union-set '(1 2 3) '(1 2 3)) '(1 2 3))
