; Asks to give an implementation of adjoun-set procedure using ordered list representation. 
(load "../common.scm")

(define (element-of-set? x set)
;;; implementation from the book. 
;;; Stops looking for for the item when reaches a element that is larger then x.
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoun-set x set)
  (if (element-of-set x set) 
      set
      (cons x set)))