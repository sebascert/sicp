(define (lower-bound int)
 (car int))

(define (make-interval a b)
 (cons a b))

(define (upper-bound int)
 (cdr int))

(define interval (make-interval -1 1))
(test (lower-bound interval) -1)
(test (upper-bound interval) 1)
