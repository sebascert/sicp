(load "packages/huffman_tree.scm")
(define (element-of-set? x set)
 (member x set))

(define (encode message tree)
 (define (encode-symbol symbol tree)
  (cond
   ((null? tree)
    (error "symbol not found" symbol))
   ((leaf? tree)
    nil)
   ((element-of-set? symbol (symbols (left-branch tree)))
    (cons 0 (encode-symbol symbol (left-branch tree))))
   ((element-of-set? symbol (symbols (right-branch tree)))
    (cons 1 (encode-symbol symbol (right-branch tree))))
   (else
    (error "symbol not found:" symbol))))

 (if (null? message)
  '()
  (append (encode-symbol (car message) tree) (encode (cdr message) tree))))

(define sample-tree
        (make-code-tree
         (make-leaf 'A 4)
         (make-code-tree (make-leaf 'B 2)
                         (make-code-tree (make-leaf 'D 1) (make-leaf 'C 1)))))
(define sample-message '(A D A B B C A))
(define sample-code '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(test (encode sample-message sample-tree) sample-code)
