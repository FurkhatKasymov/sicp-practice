(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (define coef (if (= (remainder k 2) 0) 2 4))
    (* coef (y k)))
  (define (next k) (+ k 1)) 
  (* (/ h 3.0)         
     (+ (term 0)
        (term n)
        (sum term 1 next (- n 1)))))