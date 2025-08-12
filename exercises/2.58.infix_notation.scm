; By parenthesizing multiplication operations (except for the root
; multiplication), the implicit parenthesis are made explicit, and they form
; the same tree structure as postfix, this expression tree can easily be
; traversed by checking for the operand on the second item of the expression
; list, and the invariant of augend and multiplicand are kept, as every
; expression is ensured to be a sum of multiplications or multiplication of
; factors.
; There are multiple redundant parenthesis, but this approach does not require
; a parsing algorithm, and normalizing them would be a nightmare with this
; solution, so it stays like this :)
(load "packages/derivatives.scm")
(define (addend s)
 (car s))

(define (augend s)
 (let ((rest (cddr s)))
  (if (null? (cdr rest))
   (car rest)
   rest)))

(define (make-product m1 m2)
 (cond
  ((or (=number? m1 0)
       (=number? m2 0))
   0)
  ((=number? m1 1)
   m2)
  ((=number? m2 1)
   m1)
  ((and (number? m1)
        (number? m2))
   (* m1 m2))
  (else
   (list m1 '* m2))))

(define (make-sum a1 a2)
 (cond
  ((=number? a1 0)
   a2)
  ((=number? a2 0)
   a1)
  ((and (number? a1)
        (number? a2))
   (+ a1 a2))
  (else
   (list a1 '+ a2))))

(define (multiplicand p)
 (let ((rest (cddr p)))
  (if (null? (cdr rest))
   (car rest)
   rest)))

(define (multiplier p)
 (car p))

(define (parenthesize-infix exp)
 (cond
  ((product? exp)
   (let ((m1 (parenthesize-infix (multiplier exp)))
         (m2 (augend exp)))
    (cond
     ; also check if the last element is a factor expanded by the augend
     ((or (product? m2)
          (null? (cdddr exp)))
      (make-product m1 (parenthesize-infix m2)))
     ; precedence of multiplication over sum
     ((sum? m2)
      (make-sum (make-product m1 (parenthesize-infix (addend m2)))
                (parenthesize-infix (augend m2))))
     (else
      (make-product m1 (parenthesize-infix m2))))))
  ((sum? exp)
   (let ((a1 (parenthesize-infix (addend exp)))
         (a2 (parenthesize-infix (augend exp))))
    (make-sum a1 a2)))
  (else
   exp)))

(define (product? x)
 (and (pair? x)
      (pair? (cdr x))
      (eq? (cadr x) '*)))

(define (sum? x)
 (and (pair? x)
      (pair? (cdr x))
      (eq? (cadr x) '+)))

(define exp1 '(2 * x + 3 * (x + y + 2)))
(define exp2 '((2 * x) + 3 * (x + y + 2)))
(define exp3 '(y * x * 5 + (3 * x) + x))
(define exp4 '(y * (x * 5) + (3 * x) + x))
(define exp5 '(x * y + x * (x + y * 9)))
(define exp6 '((x * y) + x * (x + (y * 9))))
(define exp7 '(x * x * x * x))
(define exp8 '(x * (x * (x * x))))
(define exp9 '(x * x * x + x * x + 2 * x))
(define exp10 '(x * (x * x) + ((x * x) + (2 * x))))
(test (deriv (parenthesize-infix exp1) 'x) (deriv exp2 'x))
(test (deriv (parenthesize-infix exp3) 'x) (deriv exp4 'x))
(test (deriv (parenthesize-infix exp5) 'x) (deriv exp6 'x))
(test (deriv (parenthesize-infix exp7) 'x) (deriv exp8 'x))
(test (deriv (parenthesize-infix exp9) 'x) (deriv exp10 'x))
