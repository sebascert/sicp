(define car-base 2)
(define cdr-base 3)
(define (car z)
 (define (iter i m)
  (if (divides? car-base m)
   (iter (++ i) (/ m car-base))
   i))

 (iter 0 z))

(define (cdr z)
 (define (iter i m)
  (if (divides? cdr-base m)
   (iter (++ i) (/ m cdr-base))
   i))

 (iter 0 z))

(define (cons x y)
 (* (expt car-base x) (expt cdr-base y)))

(define pair (cons 0 1))
(write-line pair)
(test (car pair) 0)
(test (cdr pair) 1)
