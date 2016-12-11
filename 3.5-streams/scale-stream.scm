(define (scale-stream s c)
    (cons-stream (* (stream-car s) c) (scale-stream (stream-cdr s) c)))