; Examples of put and get from section 2.4
(load "packages/table.scm")
(define (apply-generic op . args)
 (define (fail args)
  (error "No method for these types" args))

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
         (fail (list op type-tags)))
        (t1->t2
         (apply-generic op (t1->t2 a1) a2))
        (t2->t1
         (apply-generic op a1 (t2->t1 a2)))
        (else
         (fail (list op type-tags)))))))
    (else
     (fail (list op type-tags)))))))

(define (attach-tag type-tag contents)
 (cons type-tag contents))

(define (contents datum)
 (if (pair? datum)
  (cdr datum)
  (error "Bad tagged datum: CONTENTS" datum)))

(define (ddp-table-key op type)
 (list op type))

(define (get op type)
 (let ((entry (get-table-entry DDP-TABLE (ddp-table-key op type))))
  (if entry
   (entry-value entry)
   entry)))

(define (get-coercion t1 t2)
 (get 'coercion (list t1 t2)))

(define (put op type proc)
 (set! DDP-TABLE
       (set-table-entry DDP-TABLE (make-entry (ddp-table-key op type) proc))))

(define (put-coercion t1 t2 proc)
 (put 'coercion (list t1 t2) proc))

(define (safe-apply-generic op . args)
 (let ((type-tags (map safe-type-tag args)))
  (if (member #f type-tags)
   #f
   (let ((proc (get op type-tags)))
    (if proc
     (apply proc (map contents args))
     #f)))))

(define (safe-type-tag datum)
 (if (pair? datum)
  (car datum)
  #f))

(define (type-tag datum)
 (if (pair? datum)
  (car datum)
  (error "Bad tagged datum: TYPE-TAG" datum)))

(define DDP-TABLE nil)
