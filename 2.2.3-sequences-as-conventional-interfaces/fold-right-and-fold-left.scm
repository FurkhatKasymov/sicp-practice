(load "accumulate.scm")
; given

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3)) 
(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

; given end

;results:
; -> 3/2
; -> 1/6
; -> (1 (2 (3 ())))
; -> (((() 1) 2) 3)

;-> property of op:
; position of arguments do not affect on result