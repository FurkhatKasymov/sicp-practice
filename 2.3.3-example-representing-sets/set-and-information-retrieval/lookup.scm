; Asks to implement lookup procedure for set represented as binary tree and ordered by numerical keys
(load "../common.scm")

(define (lookup given-key set)
  (cond ((null? set) false)
        ((= given-key (key (entry set)))
         (entry set))
        (else 
            (let ((left-res (lookup given-key (left-branch set))))
              (if (not left-res)
                  (lookup given-key (right-branch set))
                  left-res)))))

; testing
(define key car)
(lookup 4 (list (cons 3 'incorrect) 
                (list (cons 1 'incorrect) '() 
                                          (list (cons 2 'incorrect) '() '())) 
                (list (cons 5 'incorrect) (list (cons 4 'correct) '() '()) (list (cons 6 'incorrect) '() '()))))