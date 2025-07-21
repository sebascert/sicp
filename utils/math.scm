; num properties
(define (++ x)
  (+ x 1))
(define (-- x)
  (- x 1))
(define (even? x)
  (= (remainder x 2) 0))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (average a b)
  (/ (+ a b) 2))
; constants
(define pi
  (* 2 (acos 0)))
(define euler
  (exp 1))
(define golden-ratio
  (/ (+ 1 (sqrt 5)) 2))
