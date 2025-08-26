(load "packages/generic_arithmetic.scm")
; the implementation is in the package
(test (equ? (make-scheme-number 5) (make-scheme-number 5)) #t)
(test (equ? (make-scheme-number 5) (make-scheme-number 6)) #f)
(test (equ? (make-rational 2 4) (make-rational 1 2)) #t)
(test (equ? (make-rational 3 4) (make-rational 2 3)) #f)
(test
 (equ? (make-complex-from-real-imag 3 4) (make-complex-from-real-imag 3 4))
 #t)
(test
 (equ? (make-complex-from-real-imag 3 4) (make-complex-from-real-imag 4 3))
 #f)
(test (equ? (make-complex-from-mag-ang 5 0.927295)
            (make-complex-from-mag-ang 5 0.927295))
      #t)
(test (equ? (make-complex-from-mag-ang 5 0.927295)
            (make-complex-from-mag-ang 5 1.570796))
      #f)
