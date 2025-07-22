; constants
(define pi
  (* 2 (acos 0)))
(define euler
  (exp 1))
(define golden-ratio
  (/ (+ 1 (sqrt 5)) 2))
; num properties
(define (even? x)
  (= (remainder x 2) 0))
(define (divides? a b)
  (define (++ x)
    (+ x 1))
  (define (-- x)
    (- x 1))
  (= (remainder b a) 0))
; functions
(define (sign x)
  (if (< x 0)
      -1
      1))
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (average . args)
  (/ (apply + args) (length args)))
; conversions
(define (percent x)
  (/ x 100))
(define (rad2deg x)
  (/ (* x 180) pi))
(define (deg2rad x)
  (/ (* x pi) 180))
