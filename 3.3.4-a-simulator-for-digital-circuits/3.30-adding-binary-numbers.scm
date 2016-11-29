; ... adding two n-bit binary numbers. The inputs are A1, A2, A3, ..., An and 
; B1, B2, B3, ..., Bn are the two binary numbers to be added (each Ak and Bk
; is a 0 or a 1). The circuit generates S1, S2, S3, ..., Sn, the n bits of the
; sum, and C, the carry from the addition. Write a procedure `ripple-carry-adder`
; that generates this circuit. The procedure should take as arguments three 
; lists of n wires each -- the Ak, the Bk, and the Sk, -- and also another 
; wire C. The major drawback of the `ripple-carry-adder` is the need to wait 
; for the carry signals to propagate. ...
(load "wire.scm")
(load "primitive-function-boxes.scm")
(load "given-adders.scm")

(define (ripple-carry-adder A B S C)
    (cond ((and (null? A) (null? B) (null? S)))
          ((or (null? A) (null? B) (null? S)) 
            (error "Invalid length of arguments"))
          (else
            (let ((c1 (make-wire)))
                 (ripple-carry-adder (cdr A) (cdr B) (cdr S) c1)
                 (full-adder (car A) (car B) c1 (car S) C)))))