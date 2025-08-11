(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (center i)
 (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (div-interval x y)
 (mul-interval x
               (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))))

(define (lower-bound int)
 (car int))

(define (make-center-percent center percentage)
 (let ((width (* center (percent percentage))))
  (make-interval (- center width) (+ center width))))

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

(define (percentage i)
 (if (= (center i) 0)
  0
  (* 100 (/ (width i) (center i)))))

(define (sub-interval a b)
 (add-interval a (neg-interval b)))

(define (upper-bound int)
 (cdr int))

(define (width i)
 (/ (- (upper-bound i) (lower-bound i)) 2))
