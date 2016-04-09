#lang scheme
(require sicp-pict)

(paint einstein)

(define (flip-horiz painter)
  ((transform-painter (make-vect 1.0 0)   ; new origin
                      (make-vect 0.0 0.0)   ; new end of edge1
                      (make-vect 1.0 1.0)) painter)) ; new end of edge2

(paint (flip-horiz einstein))

(define (rotate180 painter)
  ((transform-painter (make-vect 1.0 1.0)
                      (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0)) painter))

(paint (rotate180 einstein))

(define (rotate270 painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)) painter))

(paint (rotate270 einstein))