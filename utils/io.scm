(define (print . seq)
 (for-each display seq))

(define (print-line . seq)
 (apply print seq)
 (newline))
