; given
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))
; given end

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (display structure)
    (newline)
    (if (and (pair? structure))
      (total-weight structure)
      structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


(define x (make-mobile (make-branch 1 2)
                            (make-branch 3 (make-mobile (make-branch 4 5)
                                                        (make-branch 6 7)))))

(total-weight x)

; part c skipped