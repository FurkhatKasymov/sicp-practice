; a = 2, b = 2 => 36
; (devide 2, get 3^b) 36 => 18 => 9
; (divide 3, get 2^a) 36 => 12 => 4

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (devide-untill-posible num divisor)
  (if (= (remainder num divisor) 0)
      (devide-untill-posible (/ num divisor) divisor)
      num))

(define (car num)
  (/ (log (devide-untill-posible num 3))
     (log 2)))

(define (cdr num)
  (/ (log (devide-untill-posible num 2))
     (log 3)))