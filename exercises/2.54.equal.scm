(define (equal? a b)
 (cond
  ((and (pair? a)
        (pair? b))
   (and (equal? (car a) (car b))
        (equal? (cdr a) (cdr b))))
  ((and (not (pair? a))
        (not (pair? b)))
   (eq? a b))
  (else
   #f)))

; in fact test uses equal?, but as it's comparing boolean symbols this
; shouldn't be a problem
(test (equal? 'a 'a) #t)
(test (equal? 'a 'b) #f)
(test (equal? '(a b) '(a b)) #t)
(test (equal? '(a b) '(a c)) #f)
(test (equal? '(a (b c)) '(a (b c))) #t)
(test (equal? '(a (b c)) '(a (b d))) #f)
(test (equal? '(1 2) '(1 2)) #t)
