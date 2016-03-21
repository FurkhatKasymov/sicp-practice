(load "enumerate-interval.scm")
(load "flatmap.scm")

(define (display-pretty x)
  (display "\n\n")
  (display x)
  (display "\n\n"))

(define (make-position row column)
  (cons row column))

(define (get-row position)
  (car position))

(define (get-column position)
  (cdr position))

(define (is-equal-positions? a b)
  (and (= (get-column a)
          (get-column b))
       (= (get-row a)
          (get-row b))))

(define empty-board '())

(define (adjoin-position row column queens-positions)
  (append (list (make-position row column)) queens-positions))

(define (safe? column queens-positions)
  (define (check-for-safe-iter p positions)
    (if (null? positions)
      true
      (if (is-mutually-safe? p (car positions))
        (check-for-safe-iter p (cdr positions))
        false)))
  (if (null? queens-positions)
    true
    (let ((p (car (filter (lambda (x) (= (get-column x) column))
                     queens-positions))))
      (let ((rest-of-queens (remove-position p queens-positions)))
        (check-for-safe-iter p rest-of-queens)))))

(define (remove-position p positions)
  (filter (lambda (x) (not (is-equal-positions? x p))) positions))

(define (is-mutually-safe? a b)
  (null? (filter (lambda (p) (is-equal-positions? a p))
                 (get-blocked-positions-for-column b (get-column a)))))

(define (get-blocked-positions-for-column position column)
  (let ((col-diff (- column 
                     (get-column position)))
        (row (get-row position)))
    (list (make-position row
                         column)
          (make-position (+ row
                            col-diff)
                         column)
          (make-position (- row
                            col-diff)
                         column))))

; given
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
; given end

(queens 2)