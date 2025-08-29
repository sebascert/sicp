(load "packages/data_directed_programming.scm")
; a. In the missing operation case there would be an infinite recursion.
; b. In the found operation case it would behave as expected.
; implementation in data_directed_programming
(define (get-coercion t1 t2)
 (get 'coercion (list t1 t2)))

(define (put-coercion t1 t2 proc)
 (put 'coercion (list t1 t2) proc))

(define a (attach-tag 'a 1))
(define b (attach-tag 'b 2))
(put-coercion 'a
              'a
              (lambda (a)
               (attach-tag 'a 1)))
(put-coercion 'b
              'a
              (lambda (b)
               (attach-tag 'a 1)))
(put 'op '(a a) print-line)
(apply-generic 'op a a)
(apply-generic 'op a b)
(apply-generic 'op b a)
(apply-generic 'nop a a)
