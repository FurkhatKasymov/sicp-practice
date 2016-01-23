(define (multiply a b)
  (cond 
    ((= b 0) 0)
    ((even? b) (double (multiply a (halve b))))
    (else (+ a (multiply a (- b 1))))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))