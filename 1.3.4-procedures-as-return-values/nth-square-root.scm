(load "repeated.scm")
(load "average-damp.scm")
(load "../1.3.3-procedures-as-general-methods/fixed-point.scm")


(define (nth-square-root x n)
  (let ((average-count (floor (/ (log x) (log 2)))))
    (define (func y) 
      (/ x 
        (expt y (- n 1))))
    (fixed-point ((repeated average-damp average-count) func) 1.0)))