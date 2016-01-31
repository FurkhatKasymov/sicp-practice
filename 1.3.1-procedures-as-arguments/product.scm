(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term
                  (next a)
                  next
                  b))))


(define (factorial-recursive n)
  (define (identity x) x)
  (define (add-one x) (+ x 1))
  (product-recursive identity 1 add-one n))


(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result
                          (term a)))))
  (iter a 1))


(define (factorial-iterative n)
  (define (identity x) x)
  (define (add-one x) (+ x 1))
  (product-iterative identity 1 add-one n))


(define (pi-product n)
  (define (term x)
    (/ (* x (+ x 2.0))
       (* (+ x 1.0) (+ x 1.0))))
  (define (next x) (+ x 2.0))
  (product-iterative term 2.0 next n))