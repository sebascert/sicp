(define (compose f g)
 (lambda (x)
  (f (g x))))

(define (repeated f n)
 (define (iter i g)
  (if (< i n)
   (iter (++ i) (compose f g))
   g))

 (iter 1 f))

(write-line ((repeated square 2) 5))
