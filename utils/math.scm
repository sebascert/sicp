; num properties
(define (++ x)
  (+ x 1))
(define (even? x)
  (= (remainder x 2) 0))
(define (divides? a b)
  (= (remainder b a) 0))
; nth powers
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
