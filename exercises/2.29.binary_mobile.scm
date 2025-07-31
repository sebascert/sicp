(define (balanced-branch? branch)
 (let ((structure (branch-structure branch)))
  (if (pair? structure)
   (balanced? structure)
   #t)))

(define (balanced? mobile)
 (let ((l (left-branch mobile))
       (r (right-branch mobile)))
  (if (= (* (branch-weight l) (branch-length l))
         (* (branch-weight r) (branch-length r)))
   (and (balanced-branch? l)
        (balanced-branch? r))
   #f)))

(define (branch-length branch)
 (car branch))

(define (branch-structure branch)
 (cadr branch))

(define (branch-weight branch)
 (let ((structure (branch-structure branch)))
  (if (pair? structure)
   (total-weight structure)
   structure)))

(define (left-branch mobile)
 (car mobile))

; if changed to cons only the getters would need to change
(define (make-branch length structure)
 (list length structure))

; if changed to cons only the getters would need to change
(define (make-mobile left right)
 (list left right))

(define (right-branch mobile)
 (cadr mobile))

(define (total-weight mobile)
 (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define m1 (make-mobile (make-branch 2 3) (make-branch 3 2)))
(define m2 (make-mobile (make-branch 2 3) (make-branch 2 4)))
(define m3
 (make-mobile (make-branch 4 (make-mobile (make-branch 3 2) (make-branch 2 3)))
              (make-branch 4 5)))
(define m4
 (make-mobile (make-branch 2 (make-mobile (make-branch 3 2) (make-branch 2 4)))
              (make-branch 5 4)))
(define m5
        (make-mobile
         (make-branch
          3
          (make-mobile
           (make-branch 2 (make-mobile (make-branch 1 3) (make-branch 1 3)))
           (make-branch 3 2)))
         (make-branch 2 9)))
(test (balanced? m1) #t)
(test (balanced? m2) #f)
(test (balanced? m3) #t)
(test (balanced? m4) #f)
(test (balanced? m5) #f)
