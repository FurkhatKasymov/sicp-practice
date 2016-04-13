(load "basic-deriv-from-book.scm")

; redefining sum and product to support two or more terms
(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))

(define (addend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))))
; test
(deriv '(* x y (+ x 3)) 'x)

(deriv '(+ x (* x 2 y) x) 'x)