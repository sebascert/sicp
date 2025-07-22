(define (double x)
 (* x 2))

(define (fast-mult a b)
 (cond
  ((or (= a 0)
       (= b 0))
   0)
  ((even? b)
   (double (fast-mult a (halve b))))
  (else
   (+ a (fast-mult a (- b 1))))))

(define (halve x)
 (/ x 2))

(test (fast-mult 2 0) 0)
(test (fast-mult 2 1) 2)
(test (fast-mult 2 3) 6)
(test (fast-mult 3 4) 12)
(test (fast-mult 5 3) 15)
(test (fast-mult 10 5) 50)
