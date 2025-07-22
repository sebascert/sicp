(define (gcd a b)
 (if (= b 0)
  a
  (gcd b (remainder a b))))

(gcd 206 40)
; remainder operations in applicative order (5)
; remainder operations in normal order (31 = 2*re+1 5 times)
