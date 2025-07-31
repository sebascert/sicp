(define (square-list1 items)
 (if (null? items)
  ()
  (cons (square (car items)) (square-list1 (cdr items)))))

(define (square-list2 items)
 (map square items))

(test (square-list1 (list 1 2 3 4 5)) (list 1 4 9 16 25))
(test (square-list2 (list 1 2 3 4 5)) (list 1 4 9 16 25))
