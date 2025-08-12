(load "packages/derivatives.scm")
(define (base x)
 (cadr x))

(define (deriv exp var)
 (cond
  ((number? exp)
   0)
  ((variable? exp)
   (if (same-variable? exp var)
    1
    0))
  ((sum? exp)
   (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
  ((product? exp)
   (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
             (make-product (deriv (multiplier exp) var) (multiplicand exp))))
  ((exponentiation? exp)
   (let ((b (base exp))
         (e (exponent exp)))
    (make-product (make-product e (make-exponentiation b (- e 1)))
                  (deriv b var))))
  (else
   (error "unknown expression type: DERIV" exp))))

(define (exponent x)
 (caddr x))

(define (exponentiation? x)
 (and (pair? x)
      (eq? (car x) '**)))

(define (make-exponentiation b e)
 (cond
  ((= e 1)
   b)
  ((= e 0)
   1)
  (else
   (list '** b e))))

(print-line (deriv '(** x 2) 'x))
(print-line (deriv '(** x 0) 'x))
(print-line (deriv '(** x 1) 'x))
(print-line (deriv '(** (+ x 1) 3) 'x))
