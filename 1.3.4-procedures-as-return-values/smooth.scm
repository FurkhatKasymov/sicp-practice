(load "repeated.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x) 
    (/ (+ (f (- x dx)) 
          (f x)
          (f (+ x dx)))
       3.0)))

(define (n-fold-smoothed f times)
  (repeated smooth times))