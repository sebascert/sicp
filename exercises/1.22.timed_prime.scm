(define (search-for-primes start n)
 (define (search-for-primes-iter start n)
  (cond
   ((> n 0)
    (if (timed-prime-test start)
     (search-for-primes-iter (+ start 2) (- n 1))
     (search-for-primes-iter (+ start 2) n)))))

 (search-for-primes-iter (if (even? start)
                          (+ start 1)
                          start)
                         n))

(define (timed-prime-test n)
 (define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

 (define (start-prime-test n start-time)
  (define result (prime? n))
  (if result
   (report-prime (- (runtime) start-time)))
  result)

 (newline)
 (display n)
 (start-prime-test n (runtime)))

; TODO test stdout
(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
