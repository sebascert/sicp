(define (a-plus-abs-b a b)
 ((if (> b 0)
   +
   -)
  a
  b))

(test (a-plus-abs-b 1 0) 1)
(test (a-plus-abs-b 1 1) 2)
(test (a-plus-abs-b 1 -1) 2)
