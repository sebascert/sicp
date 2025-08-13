(define (adjoin-set x set)
 (cond
  ((null? set)
   (list x))
  ((< (weight x) (weight (car set)))
   (cons x set))
  (else
   (cons (car set) (adjoin-set x (cdr set))))))

(define (choose-branch bit branch)
 (cond
  ((= bit 0)
   (left-branch branch))
  ((= bit 1)
   (right-branch branch))
  (else
   (error "bad bit: CHOOSE-BRANCH" bit))))

(define (decode bits tree)
 (define (decode-1 bits current-branch)
  (if (null? bits)
   nil
   (let ((next-branch (choose-branch (car bits) current-branch)))
    (if (leaf? next-branch)
     (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
     (decode-1 (cdr bits) next-branch)))))

 (decode-1 bits tree))

(define (element-of-set? x set)
 (member x set))

(define (encode message tree)
 (define (encode-symbol symbol tree)
  (cond
   ((null? tree)
    (error "symbol not found" symbol))
   ((leaf? tree)
    nil)
   ((element-of-set? symbol (symbols (left-branch tree)))
    (cons 0 (encode-symbol symbol (left-branch tree))))
   ((element-of-set? symbol (symbols (right-branch tree)))
    (cons 1 (encode-symbol symbol (right-branch tree))))
   (else
    (error "symbol not found:" symbol))))

 (if (null? message)
  nil
  (append (encode-symbol (car message) tree) (encode (cdr message) tree))))

(define (generate-huffman-tree pairs)
 (define (successive-merge node-set)
  (if (= (length node-set) 1)
   (car node-set)
   (let ((node (make-code-tree (car node-set) (cadr node-set))))
    (successive-merge (adjoin-set node (cddr node-set))))))

 (successive-merge (make-leaf-set pairs)))

(define (leaf? object)
 (eq? (car object) 'leaf))

(define (left-branch tree)
 (car tree))

(define (make-code-tree left right)
 (list left
       right
       (append (symbols left) (symbols right))
       (+ (weight left) (weight right))))

(define (make-leaf symbol weight)
 (list 'leaf symbol weight))

(define (make-leaf-set pairs)
 (if (null? pairs)
  nil
  (let ((pair (car pairs)))
   (adjoin-set (make-leaf (car pair) (cadr pair)) (make-leaf-set (cdr pairs))))))

(define (right-branch tree)
 (cadr tree))

(define (symbol-leaf x)
 (cadr x))

(define (symbols tree)
 (if (leaf? tree)
  (list (symbol-leaf tree))
  (caddr tree)))

(define (weight tree)
 (if (leaf? tree)
  (weight-leaf tree)
  (cadddr tree)))

(define (weight-leaf x)
 (caddr x))
