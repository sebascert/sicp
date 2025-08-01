; tests the equality (with equal?) of computed and expected
(define (test computed expected)
 (cond
  ((equal? computed expected)
   (display "pass"))
  (else
   (display "received: ")
   (display computed)
   (display " expected: ")
   (display expected)))
 (newline))

(define (time f)
 (lambda args
  (let ((start (runtime)))
   (let ((result (apply f args)))
    (display (- (runtime) start))
    (newline)
    result))))
