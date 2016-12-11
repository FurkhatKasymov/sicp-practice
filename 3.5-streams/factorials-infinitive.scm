(load "stream-map-generalized.scm")
(load "integers.scm")
(load "mul-streams.scm")

(define factorials (cons-stream 1 (mul-streams factorials integers)))

(define (test)
    (if (= (stream-ref factorials 5) 120)
        'test-passed
        (error "Failed")))