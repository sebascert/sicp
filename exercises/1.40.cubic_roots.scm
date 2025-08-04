(define tolerance 1e-05)
(define (fixed-point f first-guess)
 (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

 (define (try guess)
  (let ((next (f guess)))
   (if (close-enough? guess next)
    next
    (try next))))

 (try first-guess))

(define dx 1e-05)
(define (cubic a b c)
 (lambda (x)
  (+ (cube x) (* (square x) a) (* x b) c)))

(define (cubic-nm-root a b c)
 (newtons-method (cubic a b c) 1))

(define (deriv g)
 (lambda (x)
  (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
 (lambda (x)
  (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
 (fixed-point (newton-transform g) guess))

(print-line (cubic-nm-root 0 0 0))
(print-line (cubic-nm-root 1 1 1))
(print-line (cubic-nm-root 1 -1 -1))
(print-line (cubic-nm-root -6 11 -6))
