(define (high-order-square-tree tree)
 (map (lambda (sub-tree)
       (if (pair? sub-tree)
        (high-order-square-tree sub-tree)
        (square sub-tree)))
      tree))

(define (square-tree tree)
 (cond
  ((null? tree)
   tree)
  ((not (pair? tree))
   (square tree))
  (else
   (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(test (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
      (list 1 (list 4 (list 9 16) 25) (list 36 49)))
(test (high-order-square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
      (list 1 (list 4 (list 9 16) 25) (list 36 49)))
