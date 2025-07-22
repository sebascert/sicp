(define (average-damp f)
 (lambda (x)
  (average x (f x))))

(define (compose f g)
 (lambda (x)
  (f (g x))))

(define (fixed-point f first-guess)
 (define tolerance |.00001|)
 (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

 (define (try guess)
  (let ((next (f guess)))
   (if (close-enough? guess next)
    next
    (try next))))

 (try first-guess))

(define (nth-root x n)
 (define nth-average-damp (repeated average-damp (/ n 2)))
 (define (root-transformation y)
  (/ x (expt y (-- n))))

 (fixed-point (nth-average-damp root-transformation) 1.0))

(define (repeated f n)
 (define (iter i g)
  (if (< i n)
   (iter (++ i) (compose f g))
   g))

 (iter 1 f))

(write-line (nth-root 4 2))
(write-line (nth-root 8 3))
(write-line (nth-root 16 4))
(write-line (nth-root 32 5))
(write-line (nth-root 27 3))
(write-line (nth-root 729 6))
(write-line (nth-root |.25| 2))
(write-line (nth-root |.125| 3))
(write-line (nth-root 5 1))
(write-line (nth-root -8 3))
