; Consider the bank account objects created by make-account, with the password modification described in exercise 3.3.
; Suppose that our banking system requires the ability to make joint accounts. Define a procedure make-joint that accomplishes this.
; Make-joint should take three arguments. The first is a password-protected account.
; The second argument must match the password with which the account was defined in order for the make-joint operation to proceed.
; The third argument is a new password. Make-joint is to create an additional access to the original account using the new password.

(define (make-account balance password)
  (define manager (make-account-manager balance))
  (define (dispatch secret m)
    (if (eq? secret password)
        (if (eq? m 'get-manager)
            manager
            (manager m))
        wrong-password))
  dispatch)

(define (make-joint acc acc-password joint-password)
  (define manager (acc acc-password 'get-manager))
  (define (dispatch secret m)
    (if (eq? secret joint-password)
        (manager m)
        wrong-password))
  dispatch)

(define (make-account-manager balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else
           (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)
        
(define wrong-password (lambda (_) "Incorrect password"))


(define peter-acc (make-account 100 'open-sesame))
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
