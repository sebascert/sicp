(define (count-leaves t)
 (accumulate (lambda (count acc)
              (+ count acc))
             0
             (map (lambda (elem)
                   (if (pair? elem)
                    (count-leaves elem)
                    1))
                  t)))

(define x (cons (list 1 2) (list 3 4)))
(test (count-leaves x) 4)
(test (count-leaves (list x x)) 8)
