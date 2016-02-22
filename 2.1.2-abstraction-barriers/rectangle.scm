(load "point.scm")

(define (make-rectangle width height)
  (cons width height))

(define (make-rectangle2 top-left-point bottom-right-point)
  (cons (abs (- (x-point top-left-point) 
                (x-point bottom-right-point)))
        (abs (- (y-point top-left-point) 
                (y-point bottom-right-point)))))

(define (rectangle-width rectangle)
  (car rectangle))

(define (rectangle-height rectangle)
  (cdr rectangle))

(define (rectangle-area rect)
  (* (rectangle-width rect)
     (rectangle-height rect)))

(define (rectangle-perimeter rect)
  (* (+ (rectangle-width rect)
        (rectangle-height rect))
      2))