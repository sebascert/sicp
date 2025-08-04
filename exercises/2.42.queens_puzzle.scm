(define empty-board nil)
(define (adjoin-position row col positions)
 (append positions (list row)))

(define (queens board-size)
 (define (queen-cols k)
  (if (= k 0)
   (list empty-board)
   (filter (lambda (positions)
            (safe? k positions))
           (flatmap (lambda (rest-of-queens)
                     (map (lambda (new-row)
                           (adjoin-position new-row k rest-of-queens))
                          (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))

 (queen-cols board-size))

(define (safe? k positions)
 (define (check-prev prev i new-row)
  (if (>= i k)
   #t
   (if (let ((dist (- k i))
             (prev-row (car prev)))
        (or (= prev-row new-row)
            (= (+ prev-row dist) new-row)
            (= (- prev-row dist) new-row)))
    #f
    (check-prev (cdr prev) (++ i) new-row))))

 (check-prev positions 1 (list-ref positions (-- k))))

(define solutions (queens 8))
(map print-line solutions)
(print-line "Solutions: " (length solutions))
