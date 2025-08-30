(load "packages/data_directed_programming.scm")
(define (add x y)
 (apply-generic 'add x y))

(define (angle z)
 (apply-generic 'angle z))

(define (apply-generic op . args)
 (define (fail args)
  (error "No method for these types" args))

 (let ((type-tags (map type-tag args)))
  (let ((proc (get op type-tags)))
   (cond
    (proc
     (drop (apply proc (map contents args))))
    ((= (length args) 1)
     (let ((raised (raise (car args))))
      (if raised
       (apply-generic op raised)
       (fail))))
    ((= (length args) 2)
     (let ((a1 (car args))
           (a2 (cadr args)))
      (let ((low (order < a1 a2))
            (high (order > a1 a2)))
       (cond
        ((not low)
         (fail))
        (else
         (apply-generic op high (raise low)))))))
    (else
     (fail))))))

(define (arctan x y)
 (apply-generic 'arctan x y))

(define (cosine x)
 (apply-generic 'cosine x))

(define (div x y)
 (apply-generic 'div x y))

(define (drop num)
 (let ((projection (project num)))
  (if projection
   (drop projection)
   num)))

(define (equ? a b)
 (apply-generic 'equ? a b))

(define (imag-part z)
 (apply-generic 'imag-part z))

(define (install-complex-package)
 ;; imported procedures from rectangular and polar packages
 (define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))

 (define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))

 ;; internal procedures
 (define (add-complex z1 z2)
  (make-from-real-imag (add (real-part z1) (real-part z2))
                       (add (imag-part z1) (imag-part z2))))

 (define (div-complex z1 z2)
  (make-from-mag-ang (div (magnitude z1) (magnitude z2))
                     (sub (angle z1) (angle z2))))

 (define (mul-complex z1 z2)
  (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                     (mul (angle z1) (angle z2))))

 (define (sub-complex z1 z2)
  (make-from-real-imag (sub (real-part z1) (real-part z2))
                       (sub (imag-part z1) (imag-part z2))))

 ;; interface to rest of the system
 (define (tag z)
  (attach-tag 'complex z))

 (put 'add
      '(complex complex)
      (lambda (z1 z2)
       (tag (add-complex z1 z2))))
 (put 'sub
      '(complex complex)
      (lambda (z1 z2)
       (tag (sub-complex z1 z2))))
 (put 'mul
      '(complex complex)
      (lambda (z1 z2)
       (tag (mul-complex z1 z2))))
 (put 'div
      '(complex complex)
      (lambda (z1 z2)
       (tag (div-complex z1 z2))))
 (put 'make-from-real-imag
      'complex
      (lambda (x y)
       (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang
      'complex
      (lambda (r a)
       (tag (make-from-mag-ang r a))))
 (put 'real-part '(complex) real-part)
 (put 'imag-part '(complex) imag-part)
 (put 'magnitude '(complex) magnitude)
 (put 'angle '(complex) angle)
 (put 'equ? '(complex complex) equ?)
 (put 'zero? '(complex) zero?)
 (put 'level
      '(complex)
      (lambda (x)
       3))
 (put 'project '(complex) project)
 'done)

(define (install-polar-package)
 ;; internal procedures
 (define (angle z)
  (cadr z))

 (define (equ-polar? a b)
  (and (equ? (magnitude a) (magnitude b))
       (equ? (angle a) (angle b))))

 (define (imag-part z)
  (mul (magnitude z) (sine (angle z))))

 (define (magnitude z)
  (car z))

 (define (make-from-mag-ang r a)
  (list r a))

 (define (make-from-real-imag x y)
  (list (sqroot (add (square x) (square y))) (arctan y x)))

 (define (project x)
  (if (equ? (make-scheme-number 0) (angle x))
   (magnitude x)
   #f))

 (define (real-part z)
  (mul (magnitude z) (cosine (angle z))))

 (define zero
         (make-from-mag-ang (make-scheme-number 0) (make-scheme-number 0)))
 ;; interface to the rest of the system
 (define (tag x)
  (attach-tag 'polar x))

 (put 'real-part '(polar) real-part)
 (put 'imag-part '(polar) imag-part)
 (put 'magnitude '(polar) magnitude)
 (put 'angle '(polar) angle)
 (put 'make-from-real-imag
      'polar
      (lambda (x y)
       (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang
      'polar
      (lambda (r a)
       (tag (make-from-mag-ang r a))))
 (put 'equ? '(polar polar) equ-polar?)
 (put 'zero?
      '(polar)
      (lambda (x)
       (equ-polar? x zero)))
 (put 'project '(polar) project)
 'done)

(define (install-rational-package)
 ;; internal procedures
 (define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

 (define (arctan x y)
  (make-rat (atan (/ (numer x) (denom x)) (/ (numer y) (denom y))) 1))

 (define (cosine x)
  (make-rat (cos (/ (numer x) (denom x))) 1))

 (define (denom x)
  (cadr x))

 (define (div-rat x y)
  (make-rat (* (numer x) (denom y)) (* (denom x) (numer y))))

 (define (equ? a b)
  (and (= (numer a) (numer b))
       (= (denom a) (denom b))))

 (define (inv-rat x)
  (if (= 0 (numer x))
   (error "Division by zero" x)
   (make-rat (denom x) (numer x))))

 (define (make-rat n d)
  (let ((g (gcd n d)))
   (list (/ n g) (/ d g))))

 (define (mul-rat x y)
  (make-rat (* (numer x) (numer y)) (* (denom x) (denom y))))

 (define (numer x)
  (car x))

 (define (project x)
  (if (= 1 (denom x))
   (make-scheme-number (numer x))
   #f))

 (define (sine x)
  (make-rate (sin (/ (numer x) (denom x))) 1))

 (define (sqroot x)
  (make-rate (sqrt (numer x)) (sqrt (denom x))))

 (define (square x)
  (let ((n (numer x))
        (d (denom x)))
   (make-rate (* n n) (* d d))))

 (define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

 (define zero (make-rat 0 1))
 ;; interface to rest of the system
 (define (tag x)
  (attach-tag 'rational x))

 (put 'add
      '(rational rational)
      (lambda (x y)
       (tag (add-rat x y))))
 (put 'sub
      '(rational rational)
      (lambda (x y)
       (tag (sub-rat x y))))
 (put 'mul
      '(rational rational)
      (lambda (x y)
       (tag (mul-rat x y))))
 (put 'div
      '(rational rational)
      (lambda (x y)
       (tag (div-rat x y))))
 (put 'inv
      '(rational)
      (lambda (x)
       (tag (inv-rat x))))
 (put 'make
      'rational
      (lambda (n d)
       (tag (make-rat n d))))
 (put 'equ? '(rational rational) equ?)
 (put 'zero?
      '(rational)
      (lambda (x)
       (equ? x zero)))
 (put 'raise
      '(rational)
      (lambda (x)
       (make-complex-from-real-imag (/ (numer x) (denom x)) 0)))
 (put 'level
      '(rational)
      (lambda (x)
       2))
 (put 'project '(rational) project)
 (put 'square '(rational) square)
 (put 'sqroot '(rational) sqroot)
 (put 'cosine '(rational) cosine)
 (put 'sine '(rational) sine)
 (put 'arctan '(rational rational) arctan)
 'done)

(define (install-rectangular-package)
 ;; internal procedures
 (define (angle z)
  (arctan (imag-part z) (real-part z)))

 (define (equ-rectangular? a b)
  (and (equ? (real-part a) (real-part b))
       (equ? (imag-part a) (imag-part b))))

 (define (imag-part z)
  (cadr z))

 (define (magnitude z)
  (sqroot (add (square (real-part z)) (square (imag-part z)))))

 (define (make-from-mag-ang r a)
  (list (mul r (cosine a)) (mul r (sine a))))

 (define (make-from-real-imag x y)
  (list x y))

 (define (project x)
  (if (equ? (make-scheme-number 0) (imag-part x))
   (real-part x)
   #f))

 (define (real-part z)
  (car z))

 (define zero
         (make-from-real-imag (make-scheme-number 0) (make-scheme-number 0)))
 ;; interface to the rest of the system
 (define (tag x)
  (attach-tag 'rectangular x))

 (put 'real-part '(rectangular) real-part)
 (put 'imag-part '(rectangular) imag-part)
 (put 'magnitude '(rectangular) magnitude)
 (put 'angle '(rectangular) angle)
 (put 'make-from-real-imag
      'rectangular
      (lambda (x y)
       (tag (make-from-real-imag x y))))
 (put 'make-from-mag-ang
      'rectangular
      (lambda (r a)
       (tag (make-from-mag-ang r a))))
 (put 'equ? '(rectangular rectangular) equ-rectangular?)
 (put 'zero?
      '(rectangular)
      (lambda (x)
       (equ-rectangular? x zero)))
 (put 'project '(rectangular) project)
 'done)

(define (install-scheme-number-package)
 (define (tag x)
  (attach-tag 'scheme-number x))

 (put 'add
      '(scheme-number scheme-number)
      (lambda (x y)
       (tag (+ x y))))
 (put 'sub
      '(scheme-number scheme-number)
      (lambda (x y)
       (tag (- x y))))
 (put 'mul
      '(scheme-number scheme-number)
      (lambda (x y)
       (tag (* x y))))
 (put 'div
      '(scheme-number scheme-number)
      (lambda (x y)
       (tag (/ x y))))
 (put 'make
      'scheme-number
      (lambda (x)
       (tag x)))
 (put 'equ?
      '(scheme-number scheme-number)
      (lambda (x y)
       (= x y)))
 (put 'zero?
      '(scheme-number)
      (lambda (x)
       (= x 0)))
 (put 'raise
      '(scheme-number)
      (lambda (x)
       (make-rational x 1)))
 (put 'level
      '(scheme-number)
      (lambda (x)
       1))
 (put 'square
      '(scheme-number)
      (lambda (x)
       (tag (* x x))))
 (put 'sqroot
      '(scheme-number)
      (lambda (x)
       (tag (sqrt x))))
 (put 'cosine
      '(scheme-number)
      (lambda (x)
       (tag (cos x))))
 (put 'sine
      '(scheme-number)
      (lambda (x)
       (tag (sin x))))
 (put 'arctan
      '(scheme-number scheme-number)
      (lambda (x y)
       (tag (atan x y))))
 'done)

(define (inv x)
 (apply-generic 'inv x))

(define (is? num type)
 (eq? (type-tag num) type))

(define (level num)
 (safe-apply-generic 'level num))

(define (magnitude z)
 (apply-generic 'magnitude z))

(define (make-complex-from-mag-ang r a)
 (let ((r (cond
           ((number? r)
            (make-scheme-number r))
           (else
            r)))
       (a (cond
           ((number? a)
            (make-scheme-number a))
           (else
            a))))
  ((get 'make-from-mag-ang 'complex) r a)))

(define (make-complex-from-real-imag x y)
 (let ((x (cond
           ((number? x)
            (make-scheme-number x))
           (else
            x)))
       (y (cond
           ((number? y)
            (make-scheme-number y))
           (else
            y))))
  ((get 'make-from-real-imag 'complex) x y)))

(define (make-rational n d)
 ((get 'make 'rational) n d))

(define (make-scheme-number n)
 ((get 'make 'scheme-number) n))

(define (mul x y)
 (apply-generic 'mul x y))

(define (order cmp a b)
 (let ((la (level a))
       (lb (level b)))
  (cond
   ((or (not la)
        (not lb))
    #f)
   ((cmp la lb)
    a)
   ((cmp lb la)
    b)
   (else
    #f))))

(define (project num)
 (safe-apply-generic 'project num))

(define (raise num)
 (safe-apply-generic 'raise num))

(define (real-part z)
 (apply-generic 'real-part z))

(define (sine x)
 (apply-generic 'sine x))

(define (sqroot x)
 (apply-generic 'sqroot x))

(define (square x)
 (apply-generic 'square x))

(define (sub x y)
 (apply-generic 'sub x y))

(define (zero? x)
 (apply-generic 'zero? x))

(install-scheme-number-package)
(install-rational-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
