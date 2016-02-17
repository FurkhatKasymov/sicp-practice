(load "compose.scm")

(define (repeated proc times)
  (define (repeated-iter times result)
    (if (< times 2)
      result
      (repeated-iter (- times 1) (compose proc result))))
  (repeated-iter times proc))