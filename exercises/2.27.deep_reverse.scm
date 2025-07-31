(define (deep-reverse l)
 (if (null? l)
  l
  (let ((elem (car l)))
   (if (pair? elem)
    (append (deep-reverse (cdr l)) (list (deep-reverse elem)))
    (append (deep-reverse (cdr l)) (list elem))))))

(define x (list (list 1 2) (list 3 4)))
(test (reverse x) (list (list 3 4) (list 1 2)))
(test (deep-reverse x) (list (list 4 3) (list 2 1)))
