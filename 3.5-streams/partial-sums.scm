(load "integers.scm")
(load "add-streams")

(define (partial-sums s)
    (define res (cons-stream (stream-car s) (add-streams res (stream-cdr s))))
    res)

(define (test) 
    (define data (partial-sums integers))

    (if (and (= (stream-ref data 0) 1)
             (= (stream-ref data 1) 3)
             (= (stream-ref data 2) 6)
             (= (stream-ref data 3) 10)
             (= (stream-ref data 4) 15))
        'test-passed
        (error "Failed")))