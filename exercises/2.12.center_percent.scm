(load "packages/interval_arithmetic.scm")
(define (make-center-percent center percentage)
 (let ((width (* center (percent percentage))))
  (make-interval (- center width) (+ center width))))

(define (percentage i)
 (if (= (center i) 0)
  0
  (* 100 (/ (width i) (center i)))))

(define (sub-interval a b)
 (add-interval a (neg-interval b)))

(define (test-center-percentage c p)
 (let ((i (make-center-percent c p)))
  (test (center i) c)
  (test (percentage i) p)))

(define (width i)
 (/ (- (upper-bound i) (lower-bound i)) 2))

(test-center-percentage 100 5)
(test-center-percentage 50 10)
(test-center-percentage -30 20)
(test-center-percentage 0 25)
; should fail
(test-center-percentage 200.0 2.5)
(test-center-percentage 1 100)
(test-center-percentage -100 50)
(test-center-percentage 1 10)
(test-center-percentage 1000.0 0.1)
(test-center-percentage -0.25 80.0)
