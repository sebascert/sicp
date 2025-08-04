; cons list incorrectly as it constructs (pair element)
(define nums (list 1 2 3 4 5))
(define (square-list2 items)
 (define (iter things answer)
  (if (null? things)
   answer
   (iter (cdr things) (cons answer (square (car things))))))

 (iter items ()))

; inserts elements at the beguining of the list
(define (square-list1 items)
 (define (iter things answer)
  (if (null? things)
   answer
   (iter (cdr things) (cons (square (car things)) answer))))

 (iter items ()))

(print-line (square-list1 nums))
(print-line (square-list2 nums))
