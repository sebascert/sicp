(define (ackermann x y)
 (cond
  ((= y 0)
   0)
  ((= x 0)
   (* 2 y))
  ((= y 1)
   2)
  (else
   (ackermann (- x 1) (ackermann x (- y 1))))))

(print-line (ackermann 1 10))
(print-line (ackermann 2 4))
(print-line (ackermann 3 3))
; f(n) = 2n
(define (f n)
 (ackermann 0 n))

; g(n) = 2^n
(define (g n)
 ; g(n) = 2^(2^n)
 (ackermann 1 n))

; h(n) = tower of exponents of 2 of size n
(define (h n)
 (ackermann 2 n))

(print-line (f 5))
(print-line (g 5))
(print-line (h 4))
