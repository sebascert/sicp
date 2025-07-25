(define (expmod base exp m)
 (cond
  ((= exp 0)
   1)
  ((even? exp)
   (remainder (square (expmod base (/ exp 2) m)) m))
  (else
   (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-prime? n times)
 (cond
  ((= times 0)
   true)
  ((< n 2)
   false)
  ((fermat-test n)
   (fermat-prime? n (- times 1)))
  (else
   false)))

(define (fermat-test n)
 (define (try-it a)
  (= (expmod a n n) a))

 (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
 (fermat-prime? n 10))

(test (prime? 0) false)
(test (prime? 1) false)
(test (prime? 2) true)
(test (prime? 3) true)
(test (prime? 4) false)
(test (prime? 5) true)
(test (prime? 6) false)
(test (prime? 7) true)
(test (prime? 10) false)
(test (prime? 11) true)
