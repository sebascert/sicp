(define (pascal-triangule-elem depth i)
 (if (or (< depth 2)
         (< i 2)
         (>= i depth))
  1
  (+ (pascal-triangule-elem (- depth 1) (- i 1))
     (pascal-triangule-elem (- depth 1) i))))

(test (pascal-triangule-elem 1 1) 1)
(test (pascal-triangule-elem 2 2) 1)
(test (pascal-triangule-elem 4 2) 3)
(test (pascal-triangule-elem 5 3) 6)
