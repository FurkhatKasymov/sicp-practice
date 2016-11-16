;A deque (``double-ended queue'') is a sequence in which items can be 
;inserted and deleted at either the front or the rear. Operations on 
;deques are the constructor make-deque, the predicate empty-deque?, 
;selectors front-deque and rear-deque, and mutators front-insert-deque!, 
;rear-insert-deque!, front-delete-deque!, and rear-delete-deque!. 
;Show how to represent deques using pairs, and give implementations of 
;the operations. All operations should be accomplished in (1) steps.

(define (make-node item prev-node tail) (cons (cons item prev-node) tail))
(define item-node caar)
(define prev-node cdar)
(define (set-prev-node! node prev-node) (set-cdr! (car node) prev-node))


(define (make-deque)
	(cons '() '()))

(define (empty-deque? deque)
	(null? (car deque)))


(define (front-node-deque deque) 
	(if (empty-deque? deque)
			'()
			(car deque)))

(define set-front-ptr! set-car!)
(define set-rear-ptr! set-cdr!)

(define (front-deque deque)
	(if (empty-deque? deque)
			(error "FRONT DEQUE called with an empty deque")
			(item-node (front-node-deque deque))))

(define rear-node-deque cdr)

(define (rear-deque deque)
	(if (empty-deque? deque)
			(error "REAR DEQUE called with an empty deque")
			(item-node (rear-node-deque deque))))

(define (front-insert-deque! deque item)
	(let ((new-node (make-node item '() (front-node-deque deque))))
		(if (empty-deque? deque)
				(set-rear-ptr! deque new-node)
				(set-prev-node! (front-node-deque deque) new-node))
		(set-front-ptr! deque new-node)))

(define (front-delete-deque! deque)
	(cond ((empty-deque? deque)
				 (error "FRONT DELETE called with an empty deque"))
				((eq? (front-node-deque deque) (rear-node-deque deque))
				 (set-rear-ptr! deque '())
				 (set-front-ptr! deque '()))
				(else
				 (set-front-ptr! deque (cdr (front-node-deque deque)))
				 (set-prev-node! (front-node-deque deque) '()))))

(define (rear-insert-deque! deque item)
	(let ((new-node (make-node item (rear-node-deque deque) '())))
		(if (empty-deque? deque)
				(set-front-ptr! deque new-node)
				(set-cdr! (rear-node-deque deque) new-node))
		(set-rear-ptr! deque new-node)))

(define (rear-delete-deque! deque)
	(cond ((empty-deque? deque)
				 (error "REAR DELETE called with an empty deque"))
				((eq? (front-node-deque deque) (rear-node-deque deque))
				 (set-rear-ptr! deque '())
				 (set-front-ptr! deque '()))
				(else
				 (set-rear-ptr! deque (prev-node (rear-node-deque deque)))
				 (set-cdr! (rear-node-deque deque) '()))))

		
(define (print-deque deque)
	(define (display-item item)
		(display " ")
		(display (item-node item)))
	(define (print-iter d)
		(display-item d)
		(cond ((not (eq? d (rear-node-deque deque)))
					 (print-iter (cdr d)))))
	(if (empty-deque? deque)
			(error "PRINT DEQUE called with an empty deque")
			(print-iter (car deque))))

