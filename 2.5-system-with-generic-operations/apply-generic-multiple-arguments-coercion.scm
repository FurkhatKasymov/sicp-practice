(define (can-be-coerced? type-tags target-type)
  (if (null? type-tags)
      true
      (and (or (equal? (car type-tags) target-type)
               (get-coercion (car type-tags) target-type))
           (can-be-coerced? (cdr type-tags) target-type))))


(define (get-type-coerce-to type-tags)
  (define (iter-proc current-type rest)
    (if (can-be-coerced? current-type type-tags)
        current-type
        (if (null? rest)
            false
            (iter-proc (car rest) (cdr rest)))))
  (iter-proc (car type-tags) (cdr type-tags)))


(define (apply-generic op . args)
  (define (types-are-same? types)
    (reduce (lambda (a b) (equal? a b)) true types))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (types-are-same? type-tags)
              (error "No method for these types"
                  (list op type-tags))
              (let ((coerce-to-type (get-type-coerce-to type-tags)))
                  (if coerce-to-type
                    (apply-generic op 
                                   (map (lambda (x) 
                                          (if (equal? (type-tag x) coerce-to-type)
                                              x
                                              ((get-coercion (type-tag x) coerce-to-type) x)))
                                        args))
                    (error "No method for these types"
                      (list op type-tags)))))))))