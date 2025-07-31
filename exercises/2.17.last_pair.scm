(define (last-pair l)
 (if (or (null? l)
         (null? (cdr l)))
  l
  (last-pair (cdr l))))

(define (length items)
 (if (null? items)
  0
  (+ 1 (length (cdr items)))))

(define (list-ref items n)
 (if (= n 0)
  (car items)
  (list-ref (cdr items) (- n 1))))

(define (test-last-pair l)
 (test (last-pair l) (list (list-ref l (- (length l) 1)))))

(test-last-pair (list 1 2 3 4))
(test-last-pair (list 1 4 3 4))
(test-last-pair (list 4 3 1))
