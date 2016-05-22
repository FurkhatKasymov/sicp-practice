(load "the-system.scm")

; redefine type-tag, contents and attach-tag
; so the system will work as before except that
; ordinary numbers are represented as Scheme numbers
; rather then pairs with symbol

(define (type-tag x)
  (cond ((number? x) 'scheme-number)
        ((pair? x) (car x))
        (else (error "Wrong argument"))))

(define (contents x)
  (cond ((number? x) x)
        ((pair? x) (cdr x))
        (else (error "Wrong argument"))))

(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents)))



(install-scheme-number-package)
(define x (make-scheme-number 1))
(define y (make-scheme-number 2))
(add x y)