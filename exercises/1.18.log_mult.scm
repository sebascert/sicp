(define (double x)
 (* x 2))

(define (halve x)
 (/ x 2))

(define (log-mult a b)
 (define (log-mult-iter a b x)
  (if (= b 0)
   x
   (if (even? b)
    (log-mult-iter (double a) (halve b) x)
    (log-mult-iter a (- b 1) (+ x a)))))

 (if (> a b)
  (log-mult-iter b a 0)
  (log-mult-iter a b 0)))

(test (log-mult 2 0) 0)
(test (log-mult 2 1) 2)
(test (log-mult 2 3) 6)
(test (log-mult 3 4) 12)
(test (log-mult 5 3) 15)
(test (log-mult 10 5) 50)
