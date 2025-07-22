(load "utils/math.scm")
; evaluates the primality of x
(define (prime? x)
 (miller-rabin-prime? x 10))

; from exercise 1.24
(define (miller-rabin-prime? n times)
 (define (miller-rabin-test n)
  (define (try-it a)
   (= (expmod a (- n 1) n) 1))

  (try-it (+ 1 (random (- n 1)))))

 (cond
  ((= times 0)
   true)
  ((< n 2)
   false)
  ((miller-rabin-test n)
   (miller-rabin-prime? n (- times 1)))
  (else
   false)))

; from exercise 1.24
(define (fermat-prime? x times)
 (define (fermat-test x)
  (define (try-it a)
   (= (expmod a x x) a))

  (try-it (+ 1 (random (- x 1)))))

 (cond
  ((= times 0)
   true)
  ((< x 2)
   false)
  ((fermat-test x)
   (fermat-prime? x (- times 1)))
  (else
   false)))
