(load "../common.scm")

(define (union-set set1 set2)
;;; returns new set with all elements in set1 and set2
;;; Type: (Set, Set) -> Set
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        ((elements-of-set? (car set1) set2)
          ; skiping duplicated item
          (union-set (cdr set1) set2))
        (else (cons (car set1) 
                    (union-set (cdr set1) set2)))))