(load "basic-deriv-from-book.scm")

; redefining of deriv
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
; new rule
        ((exponentiation? exp)
         (make-product (exponent exp)
                       (make-exponentiation (base exp) (- (exponent exp) 1))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

; test
(deriv '(+ (** x 2) (** y 1)) 'x) ; -> (+ (* 2 x) 1)
