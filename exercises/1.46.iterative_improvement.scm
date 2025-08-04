(define (iterative-improvement good-enough? improve)
 (define (try guess)
  (let ((next (improve guess)))
   (if (good-enough? guess next)
    next
    (try next))))

 (lambda (guess)
  (try guess)))

(define (percent-good-enough p)
 (lambda (prev next)
  (good-enough? prev next (percent p))))

(define (sqrt x)
 (define (improve guess)
  (average guess (/ x guess)))

 ((iterative-improvement (percent-good-enough 1) improve) 1))

(print-line (sqrt 4.0))
(define tolerance 1e-05)
(define (fixed-point f first-guess)
 ((iterative-improvement (percent-good-enough 0.1) f) first-guess))

(define (golden-ratio-aprox)
 (fixed-point (lambda (x)
               (+ 1 (/ 1 x)))
              1.0))

(print-line golden-ratio)
(print-line (golden-ratio-aprox))
