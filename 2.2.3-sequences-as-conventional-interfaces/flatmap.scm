(load "accumulate.scm")
; given 
(define (flatmap proc seq)
  (accumulate append (list) (map proc seq)))
; given end