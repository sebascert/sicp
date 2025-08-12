(load "packages/derivatives.scm")
(define (augend s)
 (apply make-sum (cddr s)))

(define (make-product . multiplicands)
 (let ((num-part (accumulate *
                             1
                             (filter (lambda (m)
                                      (number? m))
                                     multiplicands)))
       (var-part (filter (lambda (m)
                          (not (number? m)))
                         multiplicands)))
  (cond
   ((null? var-part)
    num-part)
   ((= num-part 0)
    0)
   (else
    (let ((prod (cond
                 ((= num-part 1)
                  var-part)
                 (else
                  (append (list num-part) var-part)))))
     (cond
      ((> (length prod) 1)
       (append (list '*) prod))
      (else
       (car prod))))))))

(define (make-sum . summands)
 (let ((num-part (accumulate +
                             0
                             (filter (lambda (s)
                                      (number? s))
                                     summands)))
       (var-part (filter (lambda (s)
                          (not (number? s)))
                         summands)))
  (cond
   ((null? var-part)
    num-part)
   (else
    (let ((sum (cond
                ((= num-part 0)
                 var-part)
                (else
                 (append var-part (list num-part))))))
     (cond
      ((> (length sum) 1)
       (append (list '+) sum))
      (else
       (car sum))))))))

(define (multiplicand p)
 (apply make-product (cddr p)))

(print-line (deriv '(* x y (+ x 3)) 'x))
