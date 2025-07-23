(define (car z)
 (z (lambda (p q)
     p)))

(define (cdr z)
 (z (lambda (p q)
     q)))

(define (cons x y)
 (lambda (m)
  (m x y)))

(define pair (cons 0 1))
(test (car pair) 0)
(test (cdr pair) 1)
