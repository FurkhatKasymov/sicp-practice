;given
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
;given end


(define (cdr z)
  (z (lambda (p q) q)))