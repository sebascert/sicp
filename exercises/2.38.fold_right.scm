(define (fold-left op initial sequence)
 (define (iter result rest)
  (if (null? rest)
   result
   (iter (op result (car rest)) (cdr rest))))

 (iter initial sequence))

; commutative operations evaluate the same for fold-left and fold-right
(write-line (fold-right / 1 (list 1 2 3)))
(write-line (fold-left / 1 (list 1 2 3)))
(write-line (fold-right list '() (list 1 2 3)))
(write-line (fold-left list '() (list 1 2 3)))
