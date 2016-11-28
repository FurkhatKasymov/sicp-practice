; In the table implementation above, the keys are tested for equality using 
; equals? (called assic). This is not always the appropriate test. For 
; instance, we might have a table with numeric keys in which we don't need
; an exact match to the number we're looking up, but only for number within
; some tolerance of it. Design a table constructor `make-table` that takes as 
; an argument a `same-key?` procedure that will be used to access appropriate 
; `lookup` and `insert!` procedures for a local table.

(define TOLERANCE 0.0001)

(define (same-key? key-1 key-2)
    (cond ((and (number? key-1) (number? key-2))
            (< (abs (- key-1 key-2)) TOLERANCE))
          (else 
            (equal? key-1 key-2))))

(define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc key (cdr records)))))

(define (make-table)
    (let ((local-table (list '*table*)))
        (define (lookup key-1 key-2)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (cdr record)
                            false))
                    false)))
        (define (insert! key-1 key-2 value)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (set-cdr! record value)
                            (set-cdr! subtable 
                                      (cons (cons key-2 value) 
                                            (cdr subtable)))))
                    (set-cdr! local-table
                              (cons (list key-1
                                          (cons key-2 value))
                                    (cdr local-table)))))
            'ok)
        (define (dispatch m)
            (cond ((eq? m 'lookup-proc) lookup)
                  ((eq? m 'insert-proc!) insert!)
                  (else (error "Unknown operation - Table" m))))
        dispatch))


(define (test)
    (define table (make-table))
    ((table 'insert-proc!) 'key1 1.0001 'test-value)
    (if ((table 'lookup-proc) 'key1 1)
        (display "Test passed")
        (display "Failure"))
    'done)


