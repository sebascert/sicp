(define (edge1-frame1 frame)
 (cadr frame))

(define (edge1-frame2 frame)
 (list-ref frame 2))

(define (edge2-frame1 frame)
 (cddr frame))

(define (edge2-frame2 frame)
 (list-ref frame 3))

(define (make-frame1 origin edge1 edge2)
 (cons origin (cons edge1 edge2)))

(define (make-frame2 origin edge1 edge2)
 (list origin edge1 edge2))

(define (origin-frame1 frame)
 (car frame))

(define (origin-frame2 frame)
 (list-ref frame 1))
