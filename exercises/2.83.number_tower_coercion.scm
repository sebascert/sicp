(load "packages/generic_arithmetic.scm")
(define int (make-scheme-number 2))
(print-line (raise int))
(print-line (raise (raise int)))
