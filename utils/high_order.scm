(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
 (if (null? (car seqs))
  nil
  (cons (accumulate op init (map car seqs))
        (accumulate-n op init (map cdr seqs)))))

(define (enumerate-interval low high)
 (if (> low high)
  nil
  (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
 (cond
  ((null? tree)
   nil)
  ((not (pair? tree))
   (list tree))
  (else
   (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))

(define (filter predicate sequence)
 (cond
  ((null? sequence)
   nil)
  ((predicate (car sequence))
   (cons (car sequence) (filter predicate (cdr sequence))))
  (else
   (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
 (accumulate append nil (map proc seq)))

(define (fold-left op initial sequence)
 (define (iter result rest)
  (if (null? rest)
   result
   (iter (op result (car rest)) (cdr rest))))

 (iter initial sequence))

(define (remove item sequence)
 (filter (lambda (x)
          (not (= x item)))
         sequence))
