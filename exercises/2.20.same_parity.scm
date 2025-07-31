(define (same-parity p . l)
 (define (append-with-same-parity sl il)
  (cond
   ((null? il)
    sl)
   ((not (same-parity? (car il)))
    (append-with-same-parity sl (cdr il)))
   (else
    (append-with-same-parity (append sl (list (car il))) (cdr il)))))

 (define (same-parity? x)
  (= (remainder x 2) (remainder p 2)))

 (if (null? l)
  l
  (append-with-same-parity (list p) l)))

(test (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(test (same-parity 2 3 4 5 6 7) (list 2 4 6))
