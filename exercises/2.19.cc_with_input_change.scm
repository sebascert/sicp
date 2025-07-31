(define (cc amount coin-values)
 (define (except-first-denomination cl)
  (cdr cl))

 (define (first-denomination cl)
  (car cl))

 (define (no-more? cl)
  (null? cl))

 (cond
  ((= amount 0)
   1)
  ((or (< amount 0)
       (no-more? coin-values))
   0)
  (else
   (+ (cc amount (except-first-denomination coin-values))
      (cc (- amount (first-denomination coin-values)) coin-values)))))

(define timed-cc (time cc))
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define reverse-uk-coins (reverse uk-coins))
(test (cc 100 us-coins) 292)
(test (timed-cc 100 uk-coins) 104561)
(test (timed-cc 100 reverse-uk-coins) 104561)
; The answer is the same but when the coins are sorted in ascending order the
; procedure is much slower because the algorithm has to check cases in which
; the remaining denominations would be discarded otherwise
