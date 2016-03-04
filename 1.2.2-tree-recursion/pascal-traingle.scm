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