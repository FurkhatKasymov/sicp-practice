(define (inverter input output)
    (define (invert-input)
        (let ((new-value (logical-not (get-signal input))))
            (after-delay inverter-delay
                         (lambda () 
                            (set-signal! output new-value)))))
    (add-action! input invert-input)
    'ok)

(define (logical-not s)
    (cond ((= s 0) 1)
          ((= s 1) 0)
          (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output)
    (define (and-action-procedure)
        (let ((new-value (logical-and (get-signal a1)
                                      (get-signal a2))))
             (after-delay and-gate-delay
                          (lambda ()
                            (set-signal! output new-value)))))
    (add-action! a1 and-action-procedure)
    (add-action! a2 and-action-procedure)
    'ok)

(define (logical-and s1 s2)
    (cond ((and (= s1 1) (= s2 1)) 1)
          ((or (and (= s1 1) (= s2 0))
               (and (= s1 0) (= s2 1))
               (and (= s1 0) (= s2 0))) 0)
          (else (error "Invalid signals" s1 s2))))

(define (or-gate o1 o2 output)
    (define (or-action-procedure)
        (let ((new-value (logical-or (get-signal o1)
                                     (get-signal o2))))
        (after-delay or-gate-delay
                     (lambda () 
                        (set-signal! output new-value)))))
    (add-action! o1 or-action-procedure)
    (add-action! o2 or-action-procedure)
    'ok)

(define (logical-or s1 s2)
    (cond ((or (= s1 1) (= s2 1)) 1)
          ((and (= s1 0) (= s2 0)) 0)
          (else (error "Invalid signals" s1 s2))))