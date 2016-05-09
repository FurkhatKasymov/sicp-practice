(define (get-record division empl)
  (get division empl))

(define (get-salary empl-record)
  (get 'salary empl-record))

(define (find-employee-record divisions empl)
  (if (null? divisions) 
      false
      (let ((record (get-record (car divisions) empl)))
        (if (null? record)
            (find-employee-record (cdr divisions) empl)
            record))))