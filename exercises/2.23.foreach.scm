(define (foreach f l)
 (define (iter a)
  (cond
   ((null? a)
    #t)
   (else
    (f (car a))
    (iter (cdr a)))))

 (iter l))

; trivial
(define (foreach f l)
 (map f l)
 #t)

(for-each (lambda (x)
           (newline)
           (display x))
          (list 57 321 88))
