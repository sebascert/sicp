(load "packages/generic_arithmetic.scm")
; implementation in generic_arithmetic
(define zero (make-scheme-number 0))
(define int (make-scheme-number 5))
(define rat (make-rational 1 2))
(print-line (add int rat))
(print-line (inv int))
(print-line (inv zero))
