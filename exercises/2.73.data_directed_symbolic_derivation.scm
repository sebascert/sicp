(load "packages/derivatives.scm")
(load "packages/data_directed_programming.scm")
; This refactorization of (deriv) abstracts the details of specific operation
; types, while maintaining the base rules of diferentiation, not specific to
; any operation. The number? and variable? cases cannot be abstracted as no
; operation is taking place.
(define (deriv exp var)
 (cond
  ((number? exp)
   0)
  ((variable? exp)
   (if (same-variable? exp var)
    1
    0))
  (else
   ((get 'deriv (operator exp)) exp var))))

(define (install-deriv-exponent)
 ;; internal procedures
 (define (deriv-module exp var)
  (let ((b (base exp))
        (e (exponent exp)))
   (make-product (make-product e (make-exponentiation b (- e 1)))
                 (deriv b var))))

 ;; interface to the rest of the system
 (put 'deriv '** deriv-module))

(define (install-deriv-product)
 ;; internal procedures
 (define (deriv-module exp var)
  (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var) (multiplicand exp))))

 ;; interface to the rest of the system
 (put 'deriv '* deriv-module))

(define (install-deriv-sum)
 ;; internal procedures
 (define (deriv-module exp var)
  (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))

 ;; interface to the rest of the system
 (put 'deriv '+ deriv-module))

(define (operator exp)
 (car exp))

(install-deriv-sum)
(install-deriv-product)
(install-deriv-exponent)
(test (deriv '(+ (* (+ x 1) x) (** x 2)) 'x) '(+ (+ (+ x 1) x) (* 2 x)))
; On the mentioned cases in which the indexing on the dispatch is swaped, every
; instance of (put) would have to be modified, making this desing desicion
; stiffer.
