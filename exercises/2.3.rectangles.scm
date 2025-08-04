(define (make-point x y)
 (cons x y))

(define (x-point p)
 (car p))

(define (y-point p)
 (cdr p))

;(define (make-rect origin len)
;  (let ((diagonal (* len (sqrt 2))))
;    (cons origin diagonal)))
;(define (origin-rect rect)
;  (car rect))
;(define (len-rect rect)
;  (/ (cdr rect) (sqrt 2)))
(define (area rect)
 (square (len-rect rect)))

(define (len-rect rect)
 (cdr rect))

(define (make-rect origin len)
 (cons origin len))

(define (origin-rect rect)
 (car rect))

(define (perimeter rect)
 (* 4 (len-rect rect)))

(define rectangle (make-rect (make-point 0 0) 1))
(print-line (perimeter rectangle))
(print-line (area rectangle))
(define rectangle (make-rect (make-point 0 0) 5))
(print-line (perimeter rectangle))
(print-line (area rectangle))
