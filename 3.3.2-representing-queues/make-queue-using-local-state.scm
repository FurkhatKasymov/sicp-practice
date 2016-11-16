;Instead of representing a queue as a pair of pointers, we can build
;a queue as a procedure with local state. The local state will consist
;of pointers to the beginning and the end of an ordinary list.
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    ;selectors
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (car front-ptr))
    ;mutators
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
               (set-cdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)))))
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue"))
            (else
             (set! front-ptr (cdr front-ptr)))))
    
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?)
             empty-queue?)
            ((eq? m 'front-queue)
             front-queue)
            ((eq? m 'insert-queue!)
             insert-queue!)
            ((eq? m 'delete-queue!)
             delete-queue!)
            (else
             (error "Method not found" m))))
             
    dispatch))