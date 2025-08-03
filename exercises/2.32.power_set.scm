; subset works because by treating the subsets as every subset except the first
; element, and returning them and them with the first element, parting from the
; base case of the empty set, with this method each element is tested for
; inclusion, and all permutations are returned.
(define (subsets s)
 (if (null? s)
  (list s)
  (let ((rest (subsets (cdr s))))
   (append rest
           (map (lambda (u)
                 (cons (car s) u))
                rest)))))

(display (subsets (list 1 2 3)))
