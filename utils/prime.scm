; from exercise 1.24
; evaluates the primality of x
(load "utils/math.scm")
(define (prime? x)
 (define (expmod base exp m)
  (cond
   ((= exp 0)
    1)
   ((even? exp)
    (remainder (square (expmod base (/ exp 2) m)) m))
   (else
    (remainder (* base (expmod base (- exp 1) m)) m))))

 (define (fermat-prime? x times)
  (cond
   ((= times 0)
    true)
   ((< x 2)
    false)
   ((fermat-test x)
    (fermat-prime? x (- times 1)))
   (else
    false)))

 (define (fermat-test x)
  (define (try-it a)
   (= (expmod a x x) a))

  (try-it (+ 1 (random (- x 1)))))

 (fermat-prime? x 10))
