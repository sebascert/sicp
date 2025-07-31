(define (reverse l)
 (define (rev l)
  (if (null? (cdr l))
   (list (car l))
   (append (rev (cdr l)) (list (car l)))))

 (if (pair? l)
  (rev l)
  l))

(define (test-reverse l e)
 (test (reverse l) e))

(test-reverse () ())
(test-reverse (list 1) (list 1))
(test-reverse (list 1 2) (list 2 1))
(test-reverse (list 1 2 3) (list 3 2 1))
(test-reverse (list 4 3 2 1) (list 1 2 3 4))
(test-reverse (list 1 2 3 4) (list 4 3 2 1))
