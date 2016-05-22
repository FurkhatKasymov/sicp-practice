(define (equ? x y) (apply-generic 'equ? x y))

(define (install-scheme-number-package)
  ; ...
  (put 'equ? '(scheme-number scheme-number) =))

(define (install-rational-package)
  ; ...
  (define (equ-rational? x y)
    (= (* (numer x) (denom y)) (* (numer y) (denom x))))

  (put 'equ? '(rational rational) equ-rational?))

(define (install-complex-package)
  ; ...
  (define (equ-complex? x y)
    (and (= (real-part x) (real-part y)) 
         (= (imag-part x) (imag-part y))))
  (put 'equ? (complex complex) equ?))