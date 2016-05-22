(define (attach-tag type-tag contents)
  (cons type-tag contents))


(define type-tag car)

(define contents cdr)



; implement table as simple a-list
(define (find-assoc key alist)
  (cond 
    ((null? alist) false)
    ((equal? key (caar alist)) (cadar alist))
    (else (find-assoc key (cdr alist)))))

(define (add-assoc key val alist)
  (cons (list key val) alist))

(define table-tag 'table)

(define (make-table) (cons table-tag '()))

(define (table-get tbl key)
  (find-assoc key (cdr tbl)))

(define (table-put! tbl key val)
  (set-cdr! tbl (add-assoc key val (cdr tbl))))


(define global-table (make-table))

(define (put op type item)
  (table-put! global-table (cons op type) item))

(define (get op type)
  (table-get global-table (cons op type)))


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
            "No method for these types -- APPLY-GENERIC"
            (list op type-tags))))))