(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (div-interval x y)
 (if (= 0 (- (lower-bound y) (upper-bound y)))
  (error "division by interval of length 0")
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))))))

(define (lower-bound int)
 (car int))

(define (make-interval a b)
 (cons a b))

(define (mul-interval x y)
 (let ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (neg-interval int)
 (make-interval (- (upper-bound int)) (- (lower-bound int))))

(define (sub-interval a b)
 (add-interval a (neg-interval b)))

(define (upper-bound int)
 (cdr int))

(div-interval (make-interval 0 1) (make-interval 1 1))
