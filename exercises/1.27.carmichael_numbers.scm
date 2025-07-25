(define (fermat-test n)
 (define (try-it a)
  (= (expmod a n n) a))

 (try-it (+ 1 (random (- n 1)))))

(test (fermat-test 561) true)
(test (fermat-test 1105) true)
(test (fermat-test 1729) true)
(test (fermat-test 2465) true)
(test (fermat-test 2821) true)
(test (fermat-test 6601) true)
