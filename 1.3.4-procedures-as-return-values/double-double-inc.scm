(define (double proc)
  (lambda (x) (proc (proc x))))

(define (inc x) (+ x 1))


(((double (double double)) inc) 5)
; 21 why? I don't get it.