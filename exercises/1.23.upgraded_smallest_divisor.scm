(define (upgraded-smallest-divisor n)
 (define (find-divisor n test-divisor)
  (cond
   ((> (square test-divisor) n)
    n)
   ((divides? test-divisor n)
    test-divisor)
   (else
    (find-divisor n (next test-divisor)))))

 (define (next test-divisor)
  (if (= test-divisor 2)
   3
   (+ test-divisor 2)))

 (find-divisor n 2))

(test (upgraded-smallest-divisor 199) 199)
(test (upgraded-smallest-divisor 1999) 1999)
(test (upgraded-smallest-divisor 19999) 7)
