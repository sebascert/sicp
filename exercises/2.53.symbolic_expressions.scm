(define (memq item x)
 (cond
  ((null? x)
   false)
  ((eq? item (car x))
   x)
  (else
   (memq item (cdr x)))))

(list 'a 'b 'c)
; Value: (a b c)
(list (list 'george))
; Value: ((george))
(cdr '((x1 x2) (y1 y2)))
; Value: ((y1 y2))
(cadr '((x1 x2) (y1 y2)))
; Value: (y1 y2)
(pair? (car '(a short list)))
; Value: #f
(memq 'red '((blue socks) (red shoes)))
; Value: #f
(memq 'red '(blue red shoes socks))
; Value: (red shoes blue socks)
