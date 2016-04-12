(require sicp-pict)

(define (split p1 p2)
  (define (proc painter n)
    (if (= n 0)
        painter
        (let ((smaller (proc painter (- n 1))))
          (p1 painter (p2 smaller smaller)))))
  proc)

(define right-split
  (split beside below))

(define up-split
  (split below beside))

(paint (right-split einstein 3))
(paint (up-split einstein 3))