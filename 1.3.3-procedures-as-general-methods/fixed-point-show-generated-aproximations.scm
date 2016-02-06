(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess number-of-steps)
    (display "Current guess is ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (cond 
        ((close-enough? guess next) (display "Total number of steps: ")
                                    (display number-of-steps)
                                    (newline)
                                    next)
        (else (try next (+ 1 number-of-steps))))))
  (try first-guess 1))


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