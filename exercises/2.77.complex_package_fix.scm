(load "packages/generic_arithmetic.scm")
; Alyssa P. Hacker corrections work because on each apply-generic call the tag
; is striped from the contents, the operator (magnitude (complex)) recieves
; either a rectangular or polar number, by calling magnitude again the correct
; operator is dispatched.
; apply-generic is invoked twice, first for (magnitude (complex)) dispatching
; magnitude again, then for (magnitude (polar)) dispatching the magnitude proc
; published by the polar package.
(trace magnitude)
(trace apply-generic)
(define z (make-complex-from-mag-ang 1 0))
(print-line (magnitude z))
