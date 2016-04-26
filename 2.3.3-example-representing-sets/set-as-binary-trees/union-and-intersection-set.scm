; Asks to give O(N) implementations of union-set and intersection-set for sets implemented as (balanced) binary trees
(load "tree->list->tree.scm")


(define (union-set set1 set2)
;;; Returns new set as balanced tree that is union (set of all elements) of set1 and set2 

  (define (merge seq1 seq2)
  ;;; Accepts two sets as ordered lists and returns merge of them
  ;;; Type: (list, list) -> list
    (cond ((null? seq1) seq2)
          ((null? seq2) seq1)
          ((= (car seq1) (car seq2))
            (cons (car seq1)
                  (merge (cdr seq1)
                             (cdr seq2))))
          ((< (car seq1) (car seq2))
              (cons (car seq1)
                    (merge (cdr seq1) 
                               seq2)))
        (else
            (cons (car seq2)
                    (merge seq1
                               (cdr seq2))))))

  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else 
            (let ((list-set1 (tree->list set1))
                  (list-set2 (tree->list set2)))
                (list->tree (merge list-set1 list-set2))))))

(union-set (list->tree (list 1 2 5 6)) (list->tree (list 2 4 6 7 9)))


(define (intersection-set set1 set2)
;;; Returns new set as balanced tree that is intersection (set of common elements) of set1 and set2
  
  (define (intersection seq1 seq2)
  ;;; Accepts two sets as orderd lists and returns intersection of them
  ;;; Type: (list, list) -> list
    (cond ((or (null? seq1) (null? seq2)) '())
          ((= (car seq1) (car seq2))
            (cons (car seq1)
                  (intersection (cdr seq1) (cdr seq2))))
          ((> (car seq1) (car seq2))
            (intersection seq1 (cdr seq2)))
          (else
            (intersection (cdr seq1) seq2))))

  (if (or (null? set1) (null? set2)) 
      '()
      (let ((list-set1 (tree->list set1))
            (list-set2 (tree->list set2)))
          (list->tree (intersection list-set1 list-set2)))))


(intersection-set (list->tree (list 1 2 5 6)) (list->tree (list 2 4 6 7 9)))





