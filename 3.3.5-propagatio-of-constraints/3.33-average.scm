; Using primitive multiplier, adder, and constant constraints, define a 
; procedure averager that takes three connectors a, b, and c as inputs and 
; establishes the constraint that the value of c is the average of the values 
; of a and b.

(load "the-constraint-system.scm")

(define (average a b c)
    (let ((s (make-connector)) (n (make-connector)))
        (adder a b s)
        (constant 2 n)
        (multiplier n c s)
        'ok))

(define (test)
    (define A (make-connector))
    (define B (make-connector))
    (define C (make-connector))
    (probe 'A A)
    (probe 'B B)
    (probe 'the-average C)
    (average A B C)
    (set-value! A 12 'user)
    (set-value! B 8 'user)
    (if (= (get-value C) 10)
        (display "\nTest passed")
        (error "Test failed")))

