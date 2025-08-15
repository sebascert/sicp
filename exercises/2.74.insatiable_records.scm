(load "packages/data_directed_programming.scm")
(define (find-employee-record division-files name)
 (define (search files)
  (if (null? files)
   #f
   (let ((record (get-record (car files) name)))
    (if record
     record
     (search (cdr files))))))

 (search division-files))

(define (get-record file name)
 (let ((record ((get 'get-record (type-tag file)) (contents file) name)))
  (if record
   (attach-tag (type-tag file) record)
   record)))

(define (get-salary record)
 (if record
  (apply-generic 'get-salary record)
  #f))

(define (install-division-x)
 ;; internal procedures
 (define (get-record file name)
  (cond
   ((null? file)
    #f)
   ((string=? name (record-name (car file)))
    (car file))
   (else
    (get-record (cdr file) name))))

 (define (make-record name salary)
  (list name salary))

 (define (record-name record)
  (car record))

 (define (record-salary record)
  (cadr record))

 ;; interface to the rest of the system
 (put 'get-record 'x get-record)
 (put 'get-salary '(x) record-salary))

(define (install-division-y)
 ;; internal procedures
 (define (get-record file name)
  (cond
   ((null? file)
    #f)
   ((string=? name (record-name (car file)))
    (car file))
   (else
    (get-record (cdr file) name))))

 (define (make-record name salary)
  (list salary name))

 (define (record-name record)
  (cadr record))

 (define (record-salary record)
  (car record))

 ;; interface to the rest of the system
 (put 'get-record 'y get-record)
 (put 'get-salary '(y) record-salary))

(install-division-x)
(install-division-y)
(define file-x '(x ("Ben Bitdiddle" 20) ("Alyssa P. Hacker" 30)))
(define file-y '(y (40 "Eva Lu Ator") (50 "Louis Reasoner")))
(define ben-entry (get-record file-x "Ben Bitdiddle"))
(print-line ben-entry)
(print-line (get-salary ben-entry))
(define eva-entry (get-record file-y "Eva Lu Ator"))
(print-line eva-entry)
(print-line (get-salary eva-entry))
(print-line (find-employee-record (list file-x file-y) "Louis Reasoner"))
; The only change needed to implement another record system it to make it
; compatible with the current interface on get-record and get-salary.
