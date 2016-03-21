(load "accumulate-n.scm")

; given
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
; given end

(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate-n * 1 (list x v))) m))

(define vector (list 2 4 6))

(define matrix (list (list 1 2 3)
                      (list 4 5 6)
                      (list 7 8 9)))

(matrix-*-vector matrix vector)
; -> ((2 8 18) (8 20 36) (14 32 54))

(define (transpose mat)
  (accumulate-n cons (list) mat))

(transpose matrix)
; -> ((1 4 7) (2 5 8) (3 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (map (lambda (x) (accumulate + 0 x)) (matrix-*-vector cols x))) m)))

(define matrix2 (list (list 1 2 3)
                      (list 1 2 3)
                      (list 1 2 3)))

(matrix-*-matrix matrix matrix2)
; -> ((6 12 18) (15 30 45) (24 48 72))