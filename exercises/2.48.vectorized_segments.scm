(load "packages.picture_language.scm")
(define (end-segment segment)
 (cdr segment))

(define (make-segment start end)
 (cons start end))

(define (start-segment segment)
 (car segment))
