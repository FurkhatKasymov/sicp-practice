(define (multiply a b)
  (m-iter a b 0))

(define (m-iter a b s)
  (cond 
    ((= b 0) s)
    ((even? b) (m-iter (double a) (halve b) s))
    (else (m-iter a (- b 1) (+ s a)))))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))