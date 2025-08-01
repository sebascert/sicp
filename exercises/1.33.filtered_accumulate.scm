(define (f n)
 (define (relative-prime? x)
  (= (gcd x n) 1))

 (filtered-accumulate relative-prime? * 1 identity 1 ++ n))

(define (filtered-accumulate pred? combiner null-value term a next b)
 (define (iter a result)
  (cond
   ((> a b)
    result)
   ((pred? a)
    (iter (next a) (combiner result (term a))))
   (else
    (iter (next a) result))))

 (iter a null-value))

(define (identity x)
 x)

(define (sum-of-prime-squares a b)
 (filtered-accumulate prime? + 0 square a ++ b))

(test (sum-of-prime-squares 1 10) 87)
(test (f 10) 189)
(test (f 7) 720)
