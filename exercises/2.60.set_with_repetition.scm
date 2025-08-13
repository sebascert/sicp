(define (adjoin-set x set)
 (cons x set))

(define (element-of-set? x set)
 (cond
  ((null? set)
   #f)
  ((equal? x (car set))
   #t)
  (else
   (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
 (cond
  ((or (null? set1)
       (null? set2))
   nil)
  ((element-of-set? (car set1) set2)
   (cons (car set1) (intersection-set (cdr set1) set2)))
  (else
   (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
 (append set1 set2))

; the only advantage is that this version is easier to implement, as no
; repetition checks have to be performed for adjoining an element or uniting
; sets. The performance is expected to be worse as the repetition would worsen
; the element lookup, but the asymptotic complexity would remain the same.
