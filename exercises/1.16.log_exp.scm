(define (log-exp b n)
 (define (log-exp-iter b n a)
  (if (= n 0)
   a
   (if (even? n)
    (log-exp-iter (square b) (/ n 2) a)
    (log-exp-iter b (- n 1) (* a b)))))

 (log-exp-iter b n 1))

(test (log-exp 2 0) 1)
(test (log-exp 2 1) 2)
(test (log-exp 2 3) 8)
(test (log-exp 3 4) 81)
(test (log-exp 5 3) 125)
(test (log-exp 10 5) 100000)
