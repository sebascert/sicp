(define (append seq1 seq2)
 (accumulate cons seq2 seq1))

(define (length sequence)
 (accumulate (lambda (x c)
              (++ c))
             0
             sequence))

(define (map p sequence)
 (accumulate (lambda (x y)
              (cons (p x) y))
             '()
             sequence))

(define l (list 1 2 3 4 5 6))
(test (append (list 1 2 3) (list 4 5 6)) l)
(test (length l) 6)
(test (map square l) (list 1 4 9 16 25 36))
