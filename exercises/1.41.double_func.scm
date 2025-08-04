(define (double f)
 (lambda (x)
  (f (f x))))

(print-line (((double (double double)) ++) 5))
