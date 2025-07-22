(define (identity x)
 x)

(define (plus-2 x)
 (+ x 2))

(define (sum term a next b)
 (define (iter a result)
  (if (> a b)
   result
   (iter (next a) (+ result (term a)))))

 (iter a 0))

(test (sum square 0 ++ 5) 55)
(test (sum identity 1 ++ 5) 15)
(test (sum square 1 ++ 3) 14)
(test (sum cube 0 ++ 3) 36)
(test (sum identity 0 plus-2 10) 30)
(test (sum identity 5 ++ 3) 0)
(test (sum identity -3 ++ 3) 0)
