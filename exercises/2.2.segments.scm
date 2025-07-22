(define (end-segment s)
 (cdr s))

(define (make-point x y)
 (cons x y))

(define (make-segment p1 p2)
 (cons p1 p2))

(define (midpoint-segment s)
 (make-point (average (x-point (start-segment s)) (y-point (end-segment s)))
             (average (x-point (start-segment s)) (y-point (end-segment s)))))

(define (print-point p)
 (display "(")
 (display (x-point p))
 (display ",")
 (display (y-point p))
 (display ")")
 (newline))

(define (start-segment s)
 (car s))

(define (x-point p)
 (car p))

(define (y-point p)
 (cdr p))

(define seg (make-segment (make-point 0 0) (make-point 1 1)))
(print-point (midpoint-segment seg))
