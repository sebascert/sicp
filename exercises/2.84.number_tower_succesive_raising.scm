(load "packages/generic_arithmetic.scm")
; implementation in generic_arithmetic
(define zero (make-scheme-number 0))
(define int (make-scheme-number 5))
(define rat (make-rational 1 2))
(test (add int rat) (make-rational 11 2))
(test (inv int) (make-rational 1 5))
(inv zero)
