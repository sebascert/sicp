(define (below1 painter1 painter2)
 (let ((split-point (make-vect 0.0 0.5)))
  (let ((paint-bottom (transform-painter painter1
                                         (make-vect 0.0 0.0)
                                         (make-vect 1.0 0.0)
                                         split-point))
        (paint-top (transform-painter painter2
                                      split-point
                                      (make-vect 1.0 0.0)
                                      (make-vect 0.0 1.0))))
   (lambda (frame)
    (paint-bottom frame)
    (paint-top frame)))))

(define (below2 painter1 painter2)
 (rotate-270 (beside (rotate-180 painter2) (rotate-180 painter1))))

(define (beside painter1 painter2)
 (let ((split-point (make-vect 0.5 0.0)))
  (let ((paint-left (transform-painter painter1
                                       (make-vect 0.0 0.0)
                                       split-point
                                       (make-vect 0.0 1.0)))
        (paint-right (transform-painter painter2
                                        split-point
                                        (make-vect 1.0 0.0)
                                        (make-vect 0.5 1.0))))
   (lambda (frame)
    (paint-left frame)
    (paint-right frame)))))
