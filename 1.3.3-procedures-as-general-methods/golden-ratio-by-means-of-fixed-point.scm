(load "fixed-point.scm")


; the golden ratio satisfy the equation
; fi^2 = fi + 1
; do little bit of math:
; (fi^2)/fi = (fi+1)/fi
; fi = fi/fi + 1/fi
; fi = 1 + 1/fi
(define (f x)
  (+ 1.0 (/ 1.0 x)))

(define golden-ratio
  (fixed-point f 1.0))