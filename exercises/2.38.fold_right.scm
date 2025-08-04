(define (fold-left op initial sequence)
 (define (iter result rest)
  (if (null? rest)
   result
   (iter (op result (car rest)) (cdr rest))))

 (iter initial sequence))

; commutative operations evaluate the same for fold-left and fold-right
(print-line (fold-right / 1 (list 1 2 3)))
(print-line (fold-left / 1 (list 1 2 3)))
(print-line (fold-right list nil (list 1 2 3)))
(print-line (fold-left list nil (list 1 2 3)))
