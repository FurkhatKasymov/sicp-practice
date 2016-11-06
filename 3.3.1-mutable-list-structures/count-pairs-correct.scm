; Devise a correct version of the count-pairs procedure of exercise 3.16 that returns
;the number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining
;an auxiliary data structure that is used to keep track of which pairs have already been counted.

(define (make-checker)
  (let ((state (list 'a)))
    (define (checker x)
      (cond ((contains? state x) #t)
            (else
             (append! state (list x))
             #f)))
    checker))

(define (contains? my-list val)
  (and (pair? my-list)
       (or (eq? (car my-list) val)
           (contains? (cdr my-list) val))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (count-pairs x)
  (define counted (make-checker))
  (define (count-pairs-iter x)
    (if (or (not (pair? x))
            (counted x))
        0
        (+ (count-pairs-iter (car x))
           (count-pairs-iter (cdr x))
           1)))
  (count-pairs-iter x))




(define three (cons 'a (cons 'b (cons 'c 'd))))

(define my-pair (cons 'a 'b))
(define four (cons 'a (cons my-pair (cons 'c 'd))))

(define seven (cons my-pair (cons my-pair (cons my-pair my-pair)))) ; duplication, 4 actual pairs

(define my-other-pair (cons 'o 'z))
(define cycle (cons 'z (cons 'z (cons 'z my-other-pair))))
(set-cdr! my-other-pair cycle) ; duplication, 4 actual pairs