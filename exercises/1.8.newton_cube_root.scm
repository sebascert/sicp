(define (newton-cube-root x)
  (define (initial-guess)
    (if (< x 1)
        1.
        (/ x 3.)))
  (define (newton-cube-root-iter guess)
    (define (next)
      (/ (+ (/ x (square guess)) (* 2 guess)) 3))
    (if (good-enough? (next) guess .01)
        guess
        (newton-cube-root-iter (next))))
  (newton-cube-root-iter (initial-guess)))
; TODO test for floating point nums
(write-line (newton-cube-root 8))
(write-line (newton-cube-root 27))
(write-line (newton-cube-root 1))
(write-line (newton-cube-root 64))
(write-line (newton-cube-root .001))
(write-line (newton-cube-root 0))
