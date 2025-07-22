; test the substittion model of the interpreter
; normal-order-evaluation (expand proc and then evaluate) or
; applicative-order-evaluation (evaluate arguments and then expand procedure)
(define (ben-bitdiddle x y)
 (if (= x 0)
  0
  y))

(define (p)
 (p))

; should never evaluate
(ben-bitdiddle 0 (p))
