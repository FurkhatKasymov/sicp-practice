(define (square-tree tree)
  (cond ((null? tree) tree)
        ((pair? tree)
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))
        (else 
          (square tree))))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
; -> (1 (4 (9 16) 25) (36 49))