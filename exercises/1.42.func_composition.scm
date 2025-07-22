(define (compose f g)
 (lambda (x)
  (f (g x))))

(write-line ((compose square ++) 6))
