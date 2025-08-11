(load "packages.picture_language.scm")
(define (add-vect a b)
 (make-vect (+ (xcor-vect a) (xcor-vect b)) (+ (ycor-vect a) (ycor-vect b))))

(define (make-vect x y)
 (cons x y))

(define (scale-vect vect k)
 (make-vect (* k (xcor-vect vect)) (* k (ycor-vect vect))))

(define (sub-vect a b)
 (make-vect (- (xcor-vect a) (xcor-vect b)) (- (ycor-vect a) (ycor-vect b))))

(define (xcor-vect vect)
 (car vect))

(define (ycor-vect vect)
 (cdr vect))
