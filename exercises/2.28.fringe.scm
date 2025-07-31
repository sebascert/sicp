(define (fringe t)
 (cond
  ((null? t)
   t)
  ((pair? t)
   (let ((f (fringe (car t)))
         (s (fringe (cdr t))))
    (cond
     ((null? f)
      s)
     ((null? s)
      f)
     (else
      (append f s)))))
  (else
   (list t))))

(define x (list (list 1 2) (list 3 4)))
(test (fringe x) (list 1 2 3 4))
(test (fringe (list x x)) (list 1 2 3 4 1 2 3 4))
