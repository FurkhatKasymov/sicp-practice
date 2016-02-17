(load "../1.3.3-procedures-as-general-methods/fixed-point.scm")

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
     
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))