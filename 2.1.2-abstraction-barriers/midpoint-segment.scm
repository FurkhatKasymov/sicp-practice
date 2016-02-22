(load "segment.scm")

(define (midpoint-segment s)
  (let ((start-s (start-segment s))
        (end-s (end-segment s)))

  (define (mid a b)
    (/ (+ a b)
       2))

  (make-point (mid (x-point start-s)
                   (x-point end-s))
              (mid (y-point start-s)
                   (y-point end-s)))))

;test
(display "\nmid of:")
(print-point (make-point -3 2))
(print-point (make-point 5 -6))
(display "\nis:")
(print-point (midpoint-segment (make-segment (make-point -3 2) (make-point 5 -6))))