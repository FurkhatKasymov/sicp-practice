; Modify the make-account procedure so that it creates password-protected accounts. That is, make-account should take a symbol as an additional argument, as in
; (define acc (make-account 100 'secret-password))
; The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:
; ((acc 'secret-password 'withdraw) 40)
; 60
; ((acc 'some-other-password 'deposit) 50)
; "Incorrect password"

; Modify the make-account procedure of exercise 3.3 by adding another local state variable so that, if an account is accessed more than seven consecutive times
; with an incorrect password, it invokes the procedure call-the-cops.

(define (make-monitored f)
  (let ((calls_num 0))
    (define (reset) (set! calls_num 0))
    (define (mf arg)
      (set! calls_num (+ calls_num 1))
      (f arg))
    (define (dispatch arg)
      (cond ((eq? arg 'how-many-calls?) calls_num)
            ((eq? arg 'reset-count) (set! calls_num 0))
            (else (mf arg))))
    dispatch))


(define (call_the_cops) (print "The call to cops has been done"))


(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define wrong-password-monitored (make-monitored (lambda (_) "Incorrect password")))
  (define miss_max 7)
  (define (handle-wrong-password _)
    (cond ((>= (wrong-password-monitored 'how-many-calls?) miss_max)
           (call_the_cops)))
        (wrong-password-monitored _))
  (define (dispatch secret m)
    (if (eq? secret password)
        (begin
          (wrong-password-monitored 'reset)
          (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m))))
        handle-wrong-password))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40) ; -> 60
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "Incorrect password"
((acc 'some-other-password 'deposit) 50) ; -> "The call to cops has been done""Incorrect password"
