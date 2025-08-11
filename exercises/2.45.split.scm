(load "packages.picture_language.scm")
(define (split sp1 sp2)
 (define (sp painter n)
  (if (= n 0)
   painter
   (let ((smaller (sp (- n 1))))
    (sp1 painter (sp2 smaller smaller)))))

 sp)

(define right-slip (split beside below))
(define up-slip (split below beside))
