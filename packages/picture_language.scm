(define (add-vect a b)
 (make-vect (+ (xcor-vect a) (xcor-vect b)) (+ (ycor-vect a) (ycor-vect b))))

(define (below painter1 painter2)
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

(define (draw-line start end)
 (print-line "drawing line")
 (print-line start)
 (print-line end))

(define (edge1-frame frame)
 (cadr frame))

(define (edge2-frame frame)
 (cddr frame))

(define (end-segment segment)
 (cdr segment))

(define (frame-coord-map frame)
 (lambda (v)
  (add-vect (origin-frame frame)
            (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                      (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (make-frame origin edge1 edge2)
 (cons origin (cons edge1 edge2)))

(define (make-segment start end)
 (cons start end))

(define (make-vect x y)
 (cons x y))

(define (origin-frame frame)
 (car frame))

(define (scale-vect vect k)
 (make-vect (* k (xcor-vect vect)) (* k (ycor-vect vect))))

(define (start-segment segment)
 (car segment))

(define (sub-vect a b)
 (make-vect (- (xcor-vect a) (xcor-vect b)) (- (ycor-vect a) (ycor-vect b))))

(define (transform-painter painter origin corner1 corner2)
 (lambda (frame)
  (let ((m (frame-coord-map frame)))
   (let ((new-origin (m origin)))
    (painter (make-frame new-origin
                         (sub-vect (m corner1) new-origin)
                         (sub-vect (m corner2) new-origin)))))))

(define (xcor-vect vect)
 (car vect))

(define (ycor-vect vect)
 (cdr vect))
