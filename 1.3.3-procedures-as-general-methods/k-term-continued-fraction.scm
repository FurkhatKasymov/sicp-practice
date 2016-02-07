(define (cont-frac-recursive N D k)

  (define (iter i)
    (if (< i k)
      (+ (D i) 
         (/ (N (+ i 1)) 
            (iter (+ i 1))))
      (D i)))

  (if (> k 0)
    (/ (N 1) 
       (iter 1))
    0))

(define (cont-frac-iterative N D k)
  
  (define (iter k buf)
    (if (< k 1)
      (/ (N 1) buf)
      (iter (- k 1) (+ (D k) (/ (N (+ k 1)) buf)))))

  (if (> k 0)
    (iter (- k 1) (D k))
    0))

(define k 38)

(define golden-ratio-recursive (lambda () 
  (cont-frac-recursive (lambda (i) 1.0) (lambda (i) 1.0) k)))

(define golden-ratio-iterative (lambda () 
  (cont-frac-iterative (lambda (i) 1.0) (lambda (i) 1.0) k)))