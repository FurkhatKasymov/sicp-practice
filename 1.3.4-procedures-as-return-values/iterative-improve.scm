(define (iterative-improve good-enough? improve)
  (define (proc guess)
    (if (good-enough? guess)
      guess
      (proc (improve guess))))
  proc)