(load "packages/generic_arithmetic.scm")
; implementation in generic_arithmetic
(define int (make-scheme-number 2))
(print-line int)
(print-line (raise int))
(print-line (raise (raise int)))
