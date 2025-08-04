(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
 (if (null? (car seqs))
  '()
  (cons (accumulate op init (map car seqs))
        (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
 (accumulate + 0 (map * v w)))

(define (matrix-*-matrix m n)
 (let ((cols (transpose n)))
  (map (lambda (r)
        (matrix-*-vector cols r))
       m)))

(define (matrix-*-vector m v)
 (map (lambda (r)
       (dot-product v r))
      m))

(define (print-matrix mat)
 (map write-line mat))

(define (transpose mat)
 (accumulate-n cons '() mat))

(define vec (list 1 2 3))
(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(write-line (matrix-*-vector matrix vec))
(newline)
(print-matrix (transpose matrix))
(newline)
(print-matrix (matrix-*-matrix matrix matrix))
