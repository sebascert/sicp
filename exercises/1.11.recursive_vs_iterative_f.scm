; impl of f
; f =  n                            if n < 3
;      f(n-1) + 2*f(n-2) + 3*f(n-3) if n >= 3

; recursive impl
(define (f_rec n)
  (if (< n 3)
      n
      (+ (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3))))))
; iterative impl
(define (f_iter n)
  (define (f_sum a b c)
    (+ a (* 2 b) (* 3 c)))
  ; m is the iteration level
  ; a b c and c represent the costs for m-1, m-2 and m-3
  ; fucking beautiful logic
  (define (f_iteration m a b c)
    (if (= m n)
        (f_sum a b c)
        (f_iteration (+ m 1) (f_sum a b c) a b)))
  (if (< n 3)
      n
      (f_iteration 3 2 1 0)))
(test (f_iter 1) (f_rec 1))
(test (f_iter 2) (f_rec 2))
(test (f_iter 3) (f_rec 3))
(test (f_iter 4) (f_rec 4))
(test (f_iter 5) (f_rec 5))
(test (f_iter 6) (f_rec 6))
(test (f_iter 1) 1)
(test (f_iter 2) 2)
(test (f_iter 3) 4)
(test (f_iter 4) 11)
(test (f_iter 5) 25)
(test (f_iter 6) 59)
