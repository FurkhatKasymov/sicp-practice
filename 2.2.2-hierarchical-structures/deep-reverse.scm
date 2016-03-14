(define (deep-reverse x)
  (define (build-deep-reversed item parent-item)
    (cond ((null? item) parent-item)
          ((pair? item) (build-deep-reversed (cdr item)
                                             (cons (build-deep-reversed (car item) (list))
                                                   parent-item)))
          (else item)))
  (build-deep-reversed x (list)))

(define test1 (list (list 1 2) (list 3 4)))
(deep-reverse test1)

(define test2 (list (list 1 2) (list 3 (list (list 4 5) (list 6 (list 7))))))

(deep-reverse test2)