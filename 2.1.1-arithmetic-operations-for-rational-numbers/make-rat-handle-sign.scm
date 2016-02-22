(define (make-rat n d) 
  (let ((g (gcd n d)))
    (if (and (< n 0) (> d 0))
      (cons (/ n g) (/ d g))
      (cons (/ (abs n) g) (/ (abs d) g)))))


(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))