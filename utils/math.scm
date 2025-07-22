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

; binary mod exponentiation from exercise 1.28
(define (expmod base exp m)
 (define (expmod-square-case x)
  (if (and (= (remainder (square x) m) 1)
           (not (or (= x 1)
                    (= x (- m 1)))))
   0
   (remainder (square x) m)))

 (cond
  ((= exp 0)
   1)
  ((even? exp)
   (expmod-square-case (expmod base (/ exp 2) m)))
  (else
   (remainder (* base (expmod base (- exp 1) m)) m))))

; conversions
(define (deg2rad x)
 (/ (* x pi) 180))

(define (percent x)
 (/ x 100))

(define (rad2deg x)
 (/ (* x 180) pi))
