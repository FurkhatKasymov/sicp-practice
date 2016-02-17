(load "newtons-method.scm")

(define (cube x)
  (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* (square x) a)
                 (* x b)
                 c)))

(define (cubic-zeros a b c)
  (newtons-method (cubic a b c) 1))