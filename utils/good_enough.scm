; from exercise 1.7
; evaluates whether the percentual difference between prev and next is strictly
; less than epsilon
(define (good-enough? prev next epsilon)
  (if (= prev 0)
      (< (abs next) epsilon)
      (< (/ (abs (- next prev)) prev) epsilon)))
