(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (center i)
 (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (div-interval x y)
 (if (= 0 (- (lower-bound y) (upper-bound y)))
  (error "division by interval of length 0")
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))))))

(define (inspect-interval i)
 (print-interval i)
 (print-center-percentage i)
 (write-line " i/i int")
 (print-interval (div-interval i i))
 (write-line " i/i cp")
 (print-center-percentage (div-interval i i))
 (newline))

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

(define (par1 r1 r2)
 (div-interval (mul-interval r1 r2) (add-interval r1 r2)))

(define (par2 r1 r2)
 (let ((one (make-interval 1 1)))
  (div-interval one (add-interval (div-interval one r1) (div-interval one r2)))))

(define (percentage i)
 (if (= (center i) 0)
  0
  (* 100 (/ (width i) (center i)))))

(define (print-center-percentage cp)
 (display "center ")
 (write-line (center cp))
 (display "percentage ")
 (write-line (percentage cp)))

(define (print-interval i)
 (display "lower ")
 (write-line (lower-bound i))
 (display "upper ")
 (write-line (upper-bound i)))

(define (sub-interval a b)
 (add-interval a (neg-interval b)))

(define (upper-bound int)
 (cdr int))

(define (width i)
 (/ (- (upper-bound i) (lower-bound i)) 2))

; from Lem E Tweakit
(print-interval (par1 (make-interval 2 3) (make-interval 4 5)))
(print-interval (par2 (make-interval 2 3) (make-interval 4 5)))
(print-center-percentage (par1 (make-interval 2 3) (make-interval 4 5)))
(print-center-percentage (par2 (make-interval 2 3) (make-interval 4 5)))
(newline)
(define a (make-interval 50 55.0))
(define b (make-interval 99.0 101.0))
(inspect-interval a)
(inspect-interval b)
(print-interval (div-interval a b))
(print-center-percentage (div-interval a b))
; see 2.15 for explanation
