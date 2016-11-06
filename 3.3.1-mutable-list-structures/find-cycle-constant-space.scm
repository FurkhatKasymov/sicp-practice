; Redo exercise 3.18 using an algorithm that takes only a constant amount of space. (This requires a very clever idea.)

(define (is-cycle? x)
  (define (iter p q)
    (or (eq? p q)
        (and (not (null? (cdr p)))
             (not (null? (cdr q)))
             (not (null? (cddr q)))
             (iter (cdr p) (cddr q)))))
  (iter x (cdr x)))


(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define my-list (list 1 2 3))
(display (is-cycle? my-list)) ; false
(make-cycle my-list)
(display (is-cycle? my-list)) ; true