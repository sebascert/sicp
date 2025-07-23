(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (lower-bound int)
 (car int))

(define (make-interval a b)
 (cons a b))

(define (neg-interval int)
 (make-interval (- (upper-bound int)) (- (lower-bound int))))

(define (negated-sub-interval a b)
 (add-interval a (neg-interval b)))

(define (sub-interval a b)
 (make-interval (- (lower-bound a) (upper-bound b))
                (- (upper-bound a) (lower-bound b))))

(define (test-sub-interval inta intb expected)
 (let ((res (sub-interval inta intb))
       (nres (negated-sub-interval inta intb)))
  (test (lower-bound res) (lower-bound expected))
  (test (lower-bound res) (lower-bound expected))
  (test (lower-bound res) (lower-bound nres))
  (test (upper-bound res) (upper-bound nres))))

(define (upper-bound int)
 (cdr int))

(test-sub-interval (make-interval -1 1)
                   (make-interval -1 1)
                   (make-interval -2 2))
(test-sub-interval (make-interval -1 2)
                   (make-interval -1 3)
                   (make-interval -4 3))
(test-sub-interval (make-interval -3 1)
                   (make-interval -2 1)
                   (make-interval -4 3))
