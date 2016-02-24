; given
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; given end



(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (church-add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))


(define (inc a) (+ a 1))
(((church-add (church-add one two) two) inc) 3) ; -> 8