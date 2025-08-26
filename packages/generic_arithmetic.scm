(load "packages/data_directed_programming.scm")
(define (add x y)
 (apply-generic 'add x y))

(define (angle z)
 (apply-generic 'angle z))

(define (div x y)
 (apply-generic 'div x y))

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
  (make-from-real-imag (+ (real-part z1) (real-part z2))
                       (+ (imag-part z1) (imag-part z2))))

 (define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))

 (define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))

 (define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
                       (- (imag-part z1) (imag-part z2))))

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
 'done)

(define (install-polar-package)
 ;; internal procedures
 (define (angle z)
  (cdr z))

 (define (equ? a b)
  (and (= (magnitude a) (magnitude b))
       (= (angle a) (angle b))))

 (define (imag-part z)
  (* (magnitude z) (sin (angle z))))

 (define (magnitude z)
  (car z))

 (define (make-from-mag-ang r a)
  (cons r a))

 (define (make-from-real-imag x y)
  (cons (sqrt (+ (square x) (square y))) (atan y x)))

 (define (real-part z)
  (* (magnitude z) (cos (angle z))))

 (define zero (make-from-mag-ang 0 0))
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
 (put 'equ? '(polar polar) equ?)
 (put 'zero?
      '(polar)
      (lambda (x)
       (equ? x zero)))
 'done)

(define (install-rational-package)
 ;; internal procedures
 (define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

 (define (denom x)
  (cdr x))

 (define (div-rat x y)
  (make-rat (* (numer x) (denom y)) (* (denom x) (numer y))))

 (define (equ? a b)
  (and (= (numer a) (numer b))
       (= (denom a) (denom b))))

 (define (make-rat n d)
  (let ((g (gcd n d)))
   (cons (/ n g) (/ d g))))

 (define (mul-rat x y)
  (make-rat (* (numer x) (numer y)) (* (denom x) (denom y))))

 (define (numer x)
  (car x))

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
 (put 'make
      'rational
      (lambda (n d)
       (tag (make-rat n d))))
 (put 'equ? '(rational rational) equ?)
 (put 'zero?
      '(rational)
      (lambda (x)
       (equ? x zero)))
 'done)

(define (install-rectangular-package)
 ;; internal procedures
 (define (angle z)
  (atan (imag-part z) (real-part z)))

 (define (equ? a b)
  (and (= (real-part a) (real-part b))
       (= (imag-part a) (imag-part b))))

 (define (imag-part z)
  (cdr z))

 (define (magnitude z)
  (sqrt (+ (square (real-part z)) (square (imag-part z)))))

 (define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))

 (define (make-from-real-imag x y)
  (cons x y))

 (define (real-part z)
  (car z))

 (define zero (make-from-real-imag 0 0))
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
 (put 'equ? '(rectangular rectangular) equ?)
 (put 'zero?
      '(rectangular)
      (lambda (x)
       (equ? x zero)))
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
 'done)

(define (magnitude z)
 (apply-generic 'magnitude z))

(define (make-complex-from-mag-ang r a)
 ((get 'make-from-mag-ang 'complex) r a))

(define (make-complex-from-real-imag x y)
 ((get 'make-from-real-imag 'complex) x y))

(define (make-rational n d)
 ((get 'make 'rational) n d))

(define (make-scheme-number n)
 ((get 'make 'scheme-number) n))

(define (mul x y)
 (apply-generic 'mul x y))

(define (real-part z)
 (apply-generic 'real-part z))

(define (sub x y)
 (apply-generic 'sub x y))

(define (zero? x)
 (apply-generic 'zero? x))

(install-scheme-number-package)
(install-rational-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
