; An accumulator is a procedure that is called repeatedly with a single numeric argument and accumulates its arguments into a sum.
; Each time it is called, it returns the currently accumulated sum. Write a procedure make-accumulator that generates accumulators,
; each maintaining an independent sum. The input to make-accumulator should specify the initial value of the sum

(define (make-accumulator cur_sum)
  (lambda (x)
    (set! cur_sum (+ cur_sum x))
    cur_sum))

(define A1 (make-accumulator 5))
(define A2 (make-accumulator 2))
(A1 10) ; -> 15
(A2 3) ; -> 5
(A1 10) ; -> 25

