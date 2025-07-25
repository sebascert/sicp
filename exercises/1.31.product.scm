(define (factorial n)
 (prod identity 1 ++ n))

(define (identity x)
 x)

(define (pi i)
 (define (square-even x)
  (square (* x 2)))

 (define (square-odd x)
  (square (+ (* x 2) 1)))

 (if (< i 1)
  0
  (/ (* 4 (+ i 1) (prod square-even 1 ++ i)) (prod square-odd 1 ++ i))))

(define (prod term a next b)
 (define (iter a result)
  (if (> a b)
   result
   (iter (next a) (* result (term a)))))

 (iter a 1))

(define (recursive-prod term a next b)
 (if (> a b)
  1
  (* (term a) (recursive-prod term (next a) next b))))

(test (factorial 0) 1)
(test (factorial 1) 1)
(test (factorial 4) 24)
(test (prod square 1 ++ 3) 36)
(test (prod (lambda (x)
             2)
            1
            ++
            4)
      16)
(test (prod identity 5 ++ 3) 1)
(test (recursive-prod square 1 ++ 3) 36)
(test (recursive-prod (lambda (x)
                       2)
                      1
                      ++
                      4)
      16)
(test (recursive-prod identity 5 ++ 3) 1)
(test (pi 1) 32/9)
(test (pi 2) 256/75)
