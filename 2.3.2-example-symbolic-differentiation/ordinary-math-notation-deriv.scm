(load "basic-deriv-from-book.scm")


; redefining to support ordinary math notation
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

;test

; a
(deriv '(x + (3 * (x + (y + 2)))) 'x) ;-> 4

; b
; (deriv '(x + 3 * (x + y + 2)) 'x')
; won't work. if we have 3 * x + 3 and we're going to return (x + 3) as multiplicand then it's will get wrong answer.