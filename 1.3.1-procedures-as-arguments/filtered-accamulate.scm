(define (filtered-accamulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
          (iter (next a) 
                (combiner result
                          (term a)))
          (iter (next a)
                result))))
  (iter a null-value))



(define (identity x) x)
(define (add-one x) (+ x 1))

(define (sum-of-squared-primes a b)
  (filtered-accamulate + 0 identity a add-one b prime?))

(define (product-of-relatively-primes n)
  (define (relatively-prime? x)
    (= (gcd x n) 1))
  (filtered-accamulate * 1 identity 2 add-one n relatively-prime?))