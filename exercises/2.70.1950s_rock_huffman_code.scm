(load "packages/huffman_tree.scm")
(define sample-distribution
        '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
(define sample-message
 '(Get a job Sha na na na na na na na na Get a Job Sha na na na na na na na na Sha boom))
(define sample-tree (generate-huffman-tree sample-distribution))
(define sample-code (encode sample-message sample-tree))
(define sample-code-length (length sample-code))
(define sample-fix-length-code-length (* 3 (length sample-message)))
(print-line sample-code)
(print-line "huffman encoded: " sample-code-length)
(print-line "fix length encoded: " sample-fix-length-code-length)
(print-line "reduced by: "
            (* (/ (- sample-fix-length-code-length sample-code-length)
                  sample-fix-length-code-length)
               100.0))
