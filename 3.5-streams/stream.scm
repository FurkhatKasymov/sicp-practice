(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))

(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream a b)
     (cons a (memo-proc (lambda () b))))))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force (cdr stream)))

(define the-empty-stream '())
(define stream-null? null?)

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))
(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x)
  (newline)
  (display x))

(define-syntax delay
    (syntax-rules () 
        ((delay exp)
         (lambda () exp))))

(define (force delay-object)
    (delay-object))


(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (test)
    (define (fizzbuzz x) (and (= 0 (remainder x 3)) (= 0 (remainder x 5))))
    (define val
        (stream-car
            (stream-cdr
                (stream-filter fizzbuzz
                    (stream-enumerate-interval 10000 1000000)))))
    (display val)
    (if (= val 10020)
        'test-passed
        (error "Failed")))