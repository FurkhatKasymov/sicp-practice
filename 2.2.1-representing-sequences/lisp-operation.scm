(define (last-pair items)
  (define (last-pair-iter items)
    (if (null? (cdr items))
        (car items)
        (last-pair-iter (cdr items))))
  (last-pair-iter items))

  (last-pair (list 23 72 149 34))


(define (reverse items)
  (define (build-reversed items parent-item)
    (if (null? items)
        parent-item
        (build-reversed (cdr items) (cons (car items) parent-item))))
  (build-reversed items (list)))

(reverse (list 1 2 3 4 5))


; given

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))
; given end

(define (first-denomination items)
  (car items))

(define (except-first-denomination items)
  (cdr items))

(define (no-more? items)
  (null? items))

(cc 100 us-coins)
;292


(define (same-parity number . items)
  (define (get-remainder x)
    (remainder x 2))
  (define numbers-remainder (get-remainder number))
  (define (collect-same-parity items)
    (cond ((null? items)
            items)
          ((= numbers-remainder (get-remainder (car items)))
            (cons (car items)
                  (collect-same-parity (cdr items))))
          (else 
            (collect-same-parity (cdr items)))))
    (cons number (collect-same-parity items)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)

