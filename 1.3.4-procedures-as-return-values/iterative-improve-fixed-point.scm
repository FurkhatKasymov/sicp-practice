(load "iterative-improve.scm")

(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))

  ((iterative-improve good-enough? f) first-guess))