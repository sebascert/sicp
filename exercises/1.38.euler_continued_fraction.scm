(define (euler-denom i)
 (let ((j (++ i)))
  (if (= (remainder j 3) 0)
   (/ (* j 2) 3)
   1)))

(define (k-continued-fraction n d k)
 (define (iter i r)
  (if (> i 0)
   (iter (- i 1) (/ (n i) (+ (d i) r)))
   r))

 (iter k 0))

(write-line euler)
(write-line (+ 2
               (k-continued-fraction (lambda (i)
                                      1.0)
                                     euler-denom
                                     1)))
(write-line (+ 2
               (k-continued-fraction (lambda (i)
                                      1.0)
                                     euler-denom
                                     5)))
(write-line (+ 2
               (k-continued-fraction (lambda (i)
                                      1.0)
                                     euler-denom
                                     10)))
