(define (newton-cube-root x)
 (define (initial-guess)
  (if (< x 1)
   1.0
   (/ x 3.0)))

 (define (newton-cube-root-iter guess)
  (define (next)
   (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  (if (good-enough? (next) guess 0.01)
   guess
   (newton-cube-root-iter (next))))

 (newton-cube-root-iter (initial-guess)))

; TODO test for floating point nums
(print-line (newton-cube-root 8))
(print-line (newton-cube-root 27))
(print-line (newton-cube-root 1))
(print-line (newton-cube-root 64))
(print-line (newton-cube-root 0.001))
(print-line (newton-cube-root 0))
