(define (attach-tag type-tag contents)
 (cond
  ((number? contents)
   contents)
  (else
   (cons type-tag contents))))

(define (contents datum)
 (cond
  ((pair? datum)
   (cdr datum))
  ((number? datum)
   datum)
  (else
   (error "Bad tagged datum: TYPE-TAG" datum))))

(define (type-tag datum)
 (cond
  ((pair? datum)
   (car datum))
  ((number? datum)
   'scheme-number)
  (else
   (error "Bad tagged datum: TYPE-TAG" datum))))

(define DDP-TABLE nil)
(define num (attach-tag 'scheme-number 5))
(define pair (attach-tag 'pair (cons 1 1)))
(print-line (type-tag num))
(print-line (contents num))
(print-line (contents pair))
(print-line (type-tag pair))
