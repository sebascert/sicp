(define (enumerate-interval low high)
 (if (> low high)
  nil
  (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
 (cond
  ((null? tree)
   nil)
  ((not (pair? tree))
   (list tree))
  (else
   (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))

(define (enumerate-unique-tuples n arity)
 (define (add-arity tuples)
  (flatmap (lambda (t)
            (map (lambda (j)
                  (cons j t))
                 (enumerate-interval 1 (- (car t) 1))))
           tuples))

 (define (iter tuples a)
  (if (< 0 a)
   (iter (add-arity tuples) (-- a))
   tuples))

 (iter (map list (enumerate-interval 1 n)) (-- arity)))
