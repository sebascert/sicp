(define (double f)
 (lambda (x)
  (f (f x))))

(write-line (((double (double double)) ++) 5))
