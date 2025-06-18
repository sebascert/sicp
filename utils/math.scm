; num properties
(define (even? x)
  (= (remainder x 2) 0))
(define (divides? a b)
  (= (remainder b a) 0))
; nth powers
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
