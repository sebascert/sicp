(load "packages/huffman_tree.scm")
(define (generate-huffman-tree pairs)
 (define (successive-merge node-set)
  (if (= (length node-set) 1)
   (car node-set)
   (let ((node (make-code-tree (car node-set) (cadr node-set))))
    (successive-merge (adjoin-set node (cddr node-set))))))

 (successive-merge (make-leaf-set pairs)))

(define sample-distribution '((A 4) (B 2) (C 1) (D 1)))
(define sample-tree
        (make-code-tree
         (make-leaf 'A 4)
         (make-code-tree (make-leaf 'B 2)
                         (make-code-tree (make-leaf 'D 1) (make-leaf 'C 1)))))
(test (generate-huffman-tree sample-distribution) sample-tree)
