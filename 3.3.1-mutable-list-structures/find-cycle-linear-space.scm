; Write a procedure that examines a list and determines whether it contains a cycle,
;that is, whether a program that tried to find the end of the list by taking successive
;cdrs would go into an infinite loop. Exercise 3.13 constructed such lists.

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

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)


(define (is-cycle? x)
  (define cycle-item? (make-checker))
  (define (iter x)
    (and (not (null? x))
         (or (cycle-item? x)
             (iter (cdr x)))))
  (iter x))

(define my-list (list 1 2 3))
(display (is-cycle? my-list)) ; false
(make-cycle my-list)
(display (is-cycle? my-list)) ; true