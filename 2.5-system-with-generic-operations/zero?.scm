(define (zero? x y) (apply-generic 'zero? x y))

(define (install-scheme-number-package)
  ; ...
  (put 'zero? '(scheme-number) 
    (lambda x) (= x 0)))

(define (install-rational-package)
  ; ...
  (define (zero-rational? x)
    (= (numer x) 0))

  (put 'zero? '(rational) zero-rational?))

(define (install-complex-package)
  ; ...
  (define (zero-complex? x)
    (and (= (real-part x) 0) 
         (= (imag-part x) 0)))
  (put 'zero? (complex) zero?))