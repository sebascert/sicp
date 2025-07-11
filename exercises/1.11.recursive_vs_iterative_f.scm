; impl of f
; f =  n                            if n < 3
;      f(n-1) + 2*f(n-2) + 3*f(n-3) if n >= 3

; recursive impl
(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))
; iterative impl
(define (f-iter n)
  (define (f-sum a b c)
    (+ a (* 2 b) (* 3 c)))
  ; m is the iteration level
  ; a b c and c represent the costs for m-1, m-2 and m-3
  ; fucking beautiful logic
  (define (f-iteration m a b c)
    (if (= m n)
        (f-sum a b c)
        (f-iteration (+ m 1) (f-sum a b c) a b)))
  (if (< n 3)
      n
      (f-iteration 3 2 1 0)))
(test (f-iter 1) (f-rec 1))
(test (f-iter 2) (f-rec 2))
(test (f-iter 3) (f-rec 3))
(test (f-iter 4) (f-rec 4))
(test (f-iter 5) (f-rec 5))
(test (f-iter 6) (f-rec 6))
(test (f-iter 1) 1)
(test (f-iter 2) 2)
(test (f-iter 3) 4)
(test (f-iter 4) 11)
(test (f-iter 5) 25)
(test (f-iter 6) 59)
