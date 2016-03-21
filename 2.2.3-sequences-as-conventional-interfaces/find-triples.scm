(load "flatmap.scm")
(load "enumerate-interval.scm")

(define (get-sum-test-for n)
  (lambda (x) 
    (= (+ (car x) 
          (cadr x) 
          (cadr (cdr x))) 
       n)))

(define (unique-triples n)
  (flatmap 
    (lambda (x) 
      (flatmap 
        (lambda (y)
          (map
            (lambda (z) (list x y z))
            (enumerate-interval 1 (- y 1))))
        (enumerate-interval 1 (- x 1))))
    (enumerate-interval 1 n)))


(define (find-triples-with-sum val n)
  (filter (get-sum-test-for val) (unique-triples n)))

(find-triples-with-sum 15 10)