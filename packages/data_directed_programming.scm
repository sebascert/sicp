; Examples of put and get from section 2.4
(load "packages/table.scm")
(define (apply-generic op . args)
 (let ((type-tags (map type-tag args)))
  (let ((proc (get op type-tags)))
   (if proc
    (apply proc (map contents args))
    (error "No method for these types: APPLY-GENERIC" (list op type-tags))))))

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

(define (put op type proc)
 (set! DDP-TABLE
       (set-table-entry DDP-TABLE (make-entry (ddp-table-key op type) proc))))

(define (type-tag datum)
 (if (pair? datum)
  (car datum)
  (error "Bad tagged datum: TYPE-TAG" datum)))

(define DDP-TABLE nil)
