(define (raise x y) (apply-generic 'raise x))

(define (install-scheme-number-package)
  ; ...
  (put 'raise '(scheme-number) 
    (lambda (x) (make-rational x 1))

(define (install-rational-package)
  ; ...
  (put 'raise '(rational) 
    (lambda (x) (make-real (/ (numer x) (denom x))))))

(define (install-real-package)
  ; ...
  (put 'raise '(real) 
    (lambda (x) (make-complex-from-real-imag x 0))))