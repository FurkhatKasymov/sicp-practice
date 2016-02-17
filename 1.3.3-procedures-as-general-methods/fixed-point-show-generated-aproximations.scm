(load "fixed-point.scm")

(define (f x)
  (/ (log 1000) (log x)))

(define solve-without-avarage (lambda () 
  (fixed-point f 2.0)))

(define solve-with-avarage (lambda () 
  (define (avarage a b)
    (/ (+ a b) 2))
  (define (f-with-avarage x)
    (avarage x (f x)))
  (fixed-point f-with-avarage 2.0)))