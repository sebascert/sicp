(define (compose f g)
 (lambda (x)
  (f (g x))))

(print-line ((compose square ++) 6))
