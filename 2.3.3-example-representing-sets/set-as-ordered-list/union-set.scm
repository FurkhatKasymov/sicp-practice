; Asks to give a O(N) implementation of union-set procedure using ordered list representation
(load "../common.scm")

(define (union-set s1 s2)
;;; Accepts two sets as ordered lists and returns set as list that merge of them
  (cond ((null? s1) s2)
        ((null? s2) s1)
        ((= (car s1) (car s2))
            (cons (car s1)
                    (union-set (cdr s1)
                               (cdr s2))))
        ((< (car s1) (car s2))
            (cons (car s1)
                    (union-set (cdr s1) 
                               s2)))
        (else
            (cons (car s2)
                    (union-set s1
                               (cdr s2))))))