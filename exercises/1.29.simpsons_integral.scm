(define (simpson-integral f a b n)
 (define h (/ (- b a) n))
 (define (simpson-integral-iter i acc)
  (if (< i n)
   (simpson-integral-iter (+ i 1)
                          (+ acc
                             (* (if (even? i)
                                 2
                                 4)
                                (simpson-integral-k i))))
   acc))

 (define (simpson-integral-k k)
  (f (+ a (* k h))))

 (*
  (/ h 3.0)
  (+ (simpson-integral-k 0) (simpson-integral-k n) (simpson-integral-iter 1 0))))

; TODO test for floating point
(print-line (simpson-integral cube 0 1 100))
(print-line (simpson-integral cube 0 1 1000))
