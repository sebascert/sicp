; constants
(define pi (* 2 (acos 0)))
(define euler (exp 1))
(define golden-ratio (/ (+ 1 (sqrt 5)) 2))
; num properties
(define (divides? a b)
 (= (remainder b a) 0))

(define (even? x)
 (= (remainder x 2) 0))

; functions
(define (++ x)
 (+ x 1))

(define (-- x)
 (- x 1))

(define (average . args)
 (/ (apply + args) (length args)))

(define (cube x)
 (* x x x))

(define (gcd a b)
 (if (= b 0)
  a
  (gcd b (remainder a b))))

(define (sign x)
 (if (< x 0)
  -1
  1))

(define (square x)
 (* x x))

; conversions
(define (deg2rad x)
 (/ (* x pi) 180))

(define (percent x)
 (/ x 100))

(define (rad2deg x)
 (/ (* x 180) pi))
