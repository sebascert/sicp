(define tolerance 1e-05)
(define (traced-fixed-point f first-guess)
 (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

 (define (try guess)
  (let ((next (f guess)))
   (print-line guess)
   (if (close-enough? guess next)
    next
    (try next))))

 (try first-guess))

(traced-fixed-point (lambda (x)
                     (/ (log 1000) (log x)))
                    2.0)
; 33 iterations
(traced-fixed-point (lambda (x)
                     (average x (/ (log 1000) (log x))))
                    2.0)
; 9 iterations
