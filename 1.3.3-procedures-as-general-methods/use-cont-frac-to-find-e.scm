(define (cont-frac N D k)
  
  (define (iter k buf)
    (if (< k 1)
      (/ (N 1) buf)
      (iter (- k 1) (+ (D k) (/ (N (+ k 1)) buf)))))

  (if (> k 0)
    (iter (- k 1) (D k))
    0))


(define e
  (+ 2
     (cont-frac (lambda (i) 1.0) 
                (lambda (i) 
                  (if (= (remainder i 3) 2)
                    (* (+ (floor (/ i 3)) 1)
                       2)
                    1.0)) 
                25)))