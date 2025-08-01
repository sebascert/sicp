(define (accumulate combiner null-value term a next b)
 (define (iter a result)
  (if (> a b)
   result
   (iter (next a) (combiner result (term a)))))

 (iter a null-value))

(define (identity x)
 x)

(define (prod term a next b)
 (accumulate * 1 term a next b))

(define (recursive-accumulate combiner null-value term a next b)
 (if (> a b)
  null-term
  (combiner (term a)
            (recursive-accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
 (accumulate + 0 term a next b))

(test (sum square 0 ++ 5) 55)
(test (sum identity 1 ++ 5) 15)
(test (sum square 1 ++ 3) 14)
(test (prod square 1 ++ 3) 36)
(test (prod (lambda (x)
             2)
            1
            ++
            4)
      16)
(test (prod identity 5 ++ 3) 1)
