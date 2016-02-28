(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))
(define (square-list items)
  (map square items))

(define (for-each proc items)
  (define (iter things)
    (cond ((null? things)
            true)
          (else 
            (proc (car things))
            (iter (cdr things)))))
  (iter items))
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))