(define (entry-key entry)
 (car entry))

(define (entry-value entry)
 (cdr entry))

(define (get-table-entry table key)
 (define (get-entry entries)
  (if (null? entries)
   #f
   (let ((entry (car entries)))
    (if (equal? key (entry-key entry))
     entry
     (get-entry (cdr entries))))))

 (get-entry table))

(define (make-entry key value)
 (cons key value))

(define (set-table-entry table new-entry)
 (define (set-entry entries)
  (if (null? entries)
   (list new-entry)
   (let ((entry (car entries)))
    (if (equal? (entry-key new-entry) (entry-key entry))
     (cons new-entry (cdr entries))
     (cons entry (set-entry (cdr entries)))))))

 (set-entry table))
