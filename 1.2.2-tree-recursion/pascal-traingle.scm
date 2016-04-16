; pascal triangle. recursive 
(define (pascal-triangle-recursive r d)
  (cond ((or (< r 1) (< d 1) (> d r)) 
          0)
        ((or (= r 1) (= d 1))
          1)
        (else 
          (+ 
            (pascal-triangle-recursive (- r 1) d) 
            (pascal-triangle-recursive (- r 1) (- d 1))))))

; pascal's triangle actually captures the idea of how many different
; ways there are of chosing objects from a set, where the order of choice doesn't matter.

(define (fact n)
  (define (fact-iter x res)
    (if (= x 0)
      res
      (fact-iter (- x 1) (* res x))))
  (fact-iter n 1))

(define (pascal-traingle-linear r d)
  (/ (fact r)
     (* (fact (- r d)) (fact d))))