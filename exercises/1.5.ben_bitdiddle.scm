; test the substittion model of the interpreter
; normal-order-evaluation (expand proc and then evaluate) or
; applicative-order-evaluation (evaluate arguments and then expand procedure)
(define (p) (p))
(define (ben-bitdiddle x y)
    (if (= x 0) 0 y))
; should never evaluate
(ben-bitdiddle 0 (p))
