(define (log-fib n)
 (log-fib-iter 1 0 0 1 n))

(define (log-fib-iter a b p q count)
 (cond
  ((= count 0)
   b)
  ((even? count)
   (log-fib-iter a b (+ (* p p) (* q q)) (+ (* q q) (* 2 (* q p))) (/ count 2)))
  (else
   (log-fib-iter (+ (* b q) (* a q) (* a p))
                 (+ (* b p) (* a q))
                 p
                 q
                 (- count 1)))))

(test (log-fib 0) 0)
(test (log-fib 1) 1)
(test (log-fib 2) 1)
(test (log-fib 3) 2)
(test (log-fib 4) 3)
(test (log-fib 5) 5)
(test (log-fib 6) 8)
(test (log-fib 7) 13)
(test (log-fib 8) 21)
