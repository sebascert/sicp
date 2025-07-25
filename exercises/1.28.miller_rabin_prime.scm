(define (expmod base exp m)
 (define (expmod-square-case x)
  (if (and (= (remainder (square x) m) 1)
           (not (or (= x 1)
                    (= x (- m 1)))))
   0
   (remainder (square x) m)))

 (cond
  ((= exp 0)
   1)
  ((even? exp)
   (expmod-square-case (expmod base (/ exp 2) m)))
  (else
   (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-prime? n times)
 (cond
  ((= times 0)
   true)
  ((< n 2)
   false)
  ((miller-rabin-test n)
   (miller-rabin-prime? n (- times 1)))
  (else
   false)))

(define (miller-rabin-test n)
 (define (try-it a)
  (= (expmod a (- n 1) n) 1))

 (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
 (miller-rabin-prime? n 10))

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
(test (prime? 561) false)
