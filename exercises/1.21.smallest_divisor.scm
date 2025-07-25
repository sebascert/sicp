(define (find-divisor n test-divisor)
 (cond
  ((> (square test-divisor) n)
   n)
  ((divides? test-divisor n)
   test-divisor)
  (else
   (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
 (find-divisor n 2))

(test (smallest-divisor 199) 199)
(test (smallest-divisor 1999) 1999)
(test (smallest-divisor 19999) 7)
