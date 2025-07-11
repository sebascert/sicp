(define (cube x)
  (* x x x))
(define (p x)
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) .1))
      angle
      (p (sine (/ angle 3.)))))
; 5 times
(sine 12.15)
; The order of growth of the number of steps is linear as on each iteration the
; problem is reduced to a/3, and it's the same for space as it's a recursive
; process which chains (p (p ...)) procedure calls the same number of times as
; steps
