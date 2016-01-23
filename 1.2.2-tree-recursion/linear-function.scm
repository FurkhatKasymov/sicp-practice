; recursive
(define (f-recursive n)
  (if (< n 3)
    3
    (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))))

; iterative
(define (f-iterative n)
  (f-iter 3 3 3 (- n 2)))

(define (f-iter n1 n2 n3 n)
  (if (<= n 0) 
    n1
    (f-iter (+ n1 (* 2 n2) (* 3 n3)) n1 n2 (- n 1))))