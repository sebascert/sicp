(define (denom x)
 (cdr x))

(define (make-rat n d)
 (let ((s (* (sign n) (sign d)))
       (n (abs n))
       (d (abs d)))
  (let ((g (gcd n d)))
   (cons (* s (/ n g)) (/ d g)))))

(define (numer x)
 (car x))

(define (print-rat x)
 (display (numer x))
 (display "/")
 (display (denom x))
 (newline))

(print-rat (make-rat -1 -1))
(print-rat (make-rat 1 -1))
(print-rat (make-rat -1 1))
