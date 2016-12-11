(load "stream.scm")
(load "stream-map-generalized.scm")
(load "integers")
(load "mul-streams.scm")
(load "scale-stream.scm")

(define integer-converses
    (stream-map (lambda (x) (/ 1 x)) integers))

(define (integrate-series s)
    (mul-streams s integer-converses))

(define exp-series
    (cons-stream 1 (integrate-series exp-series)))

(define sine-series
    (cons-stream 0 (integrate-series cosine-series)))

(define negative-ones (cons-stream -1 negative-ones))
(define cosine-series
    (cons-stream 1 (mul-streams (integrate-series sine-series) negative-ones)))

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2)) 
                  (add-streams (scale-stream (stream-cdr s2) (stream-car s1)) 
                               (mul-series (stream-cdr s1) s2))))

(define one
    (add-streams
        (mul-series sine-series sine-series)
        (mul-series cosine-series cosine-series)))

(define (test)
    (if (and (= (stream-car one) 1) (= (stream-ref one 123) 0))
        'test-passed
        (error "Failed")))