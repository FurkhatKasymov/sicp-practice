(define (fringe x) 
  (define (build-list item tail)
    (cond ((null? item) tail) 
          ((pair? item) (build-list (car item)               
                                    (build-list (cdr item) tail)))
          (else (cons item tail))))
  (build-list x (list)))

(define test-list (list (list 1 2) (list 3 4)))

(fringe test-list)

(fringe (list test-list test-list))