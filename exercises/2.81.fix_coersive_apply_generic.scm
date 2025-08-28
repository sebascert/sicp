(load "packages/data_directed_programming.scm")
; a. In the missing operation case there would be an infinite recursion.
; b. In the found operation case it would behave as expected.
(define (apply-generic op . args)
 (let ((type-tags (map type-tag args)))
  (let ((proc (get op type-tags)))
   (cond
    (proc
     (apply proc (map contents args)))
    ((= (length args) 2)
     (let ((type1 (car type-tags))
           (type2 (cadr type-tags))
           (a1 (car args))
           (a2 (cadr args)))
      (let ((t1->t2 (get-coercion type1 type2))
            (t2->t1 (get-coercion type2 type1)))
       (cond
        ((eq? type1 type2)
         (error "No method for these types" (list op type-tags)))
        (t1->t2
         (apply-generic op (t1->t2 a1) a2))
        (t2->t1
         (apply-generic op a1 (t2->t1 a2)))
        (else
         (error "No method for these types" (list op type-tags)))))))
    (else
     (error "No method for these types" (list op type-tags)))))))

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
(put 'op '(A A) print-line)
(apply-generic 'op a a)
(apply-generic 'nop a a)
(apply-generic 'op a b)
(apply-generic 'op b a)
