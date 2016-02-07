(define (cont-frac N D k)
  
  (define (iter k buf)
    (if (< k 1)
      (/ (N 1) buf)
      (iter (- k 1) (+ (D k) (/ (N (+ k 1)) buf)))))

  (if (> k 0)
    (iter (- k 1) (D k))
    0))

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
      x
      (- (* x x))))
  (define (D i)
    (+ 1.0 (* (- i 1.0) 2.0)))
  (cont-frac N D k))