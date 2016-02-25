; given

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
    (max p1 p2 p3 p4))))


(define (div-interval x y)
  (mul-interval x 
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

; given end

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (sub-interval a b)
  (make-interval (- (lower-bound a)
                    (upper-bound b))
                 (- (upper-bound a)
                    (lower-bound b))))

(define (div-interval-check-zero-spans x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "spans zero")
      (mul-interval x 
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))


(define (mul-interval-check-sign x y)
   (let ((xlo (lower-bound x))
         (xup (upper-bound x))
         (ylo (lower-bound y))
         (yup (upper-bound y)))
   (cond ((and (>= xlo 0)
               (>= xup 0)
               (>= ylo 0)
               (>= yup 0))
          (make-interval (* xlo ylo) (* xup yup)))
         ((and (>= xlo 0)
               (>= xup 0)
               (<= ylo 0)
               (>= yup 0))
          (make-interval (* xup ylo) (* xup yup)))
         ((and (>= xlo 0)
               (>= xup 0)
               (<= ylo 0)
               (<= yup 0))
          (make-interval (* xup ylo) (* xlo yup)))
         ((and (<= xlo 0)
               (>= xup 0)
               (>= ylo 0)
               (>= yup 0))
          (make-interval (* xlo yup) (* xup yup)))
         ((and (<= xlo 0)
               (>= xup 0)
               (<= ylo 0)
               (>= yup 0))
          (make-interval (min (* xup ylo) (* xlo yup))
                         (max (* xlo ylo) (* xup yup))))
         ((and (<= xlo 0)
               (>= xup 0)
               (<= ylo 0)
               (<= yup 0))
          (make-interval (* xup ylo) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xup 0)
               (>= ylo 0)
               (>= yup 0))
          (make-interval (* xlo yup) (* xup ylo)))
         ((and (<= xlo 0)
               (<= xup 0)
               (<= ylo 0)
               (>= yup 0))
          (make-interval (* xlo yup) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xup 0)
               (<= ylo 0)
               (<= yup 0))
          (make-interval (* xup yup) (* xlo ylo))))))



; given 
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
; given end

(define (get-percent-as-value a percent)
  (/ (* percent a) 100))

(define (make-center-percentage c t)
  (make-center-width c (get-percent-as-value c t)))

(define (center-percentage i)
  (center i))

(define (get-value-as-percent a b)
  (/ (* b 100) a))

(define (percent i)
  (get-value-as-percent (width)))