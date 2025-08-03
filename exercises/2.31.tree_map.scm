(define (square-tree tree)
 (tree-map square tree))

(define (tree-map f tree)
 (cond
  ((null? tree)
   tree)
  ((not (pair? tree))
   (f tree))
  (else
   (cons (tree-map f (car tree)) (tree-map f (cdr tree))))))

(test (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
      (list 1 (list 4 (list 9 16) 25) (list 36 49)))
