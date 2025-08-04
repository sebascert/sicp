(define (reverse-left sequence)
 (fold-left (lambda (x y)
             (append (list y) x))
            nil
            sequence))

(define (reverse-right sequence)
 (fold-right (lambda (x y)
              (append y (list x)))
             nil
             sequence))

(define l (list 1 2 3 4 5))
(test (reverse-left l) (reverse l))
(test (reverse-right l) (reverse l))
