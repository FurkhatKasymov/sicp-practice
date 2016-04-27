(load "sample-message-and-tree.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol sym tree)
;;; Encodes given symbol using given tree
;;; If symbol is not in the tree, then throw an error  
  (define is-valid-code? pair?)

  (define (get-code tree)
  ;;; Returns code of the symbol
  ;;; If symbol is not presented in the given tree, then returns false
  ;;; If tree is leaf, then returns boolean result either the leaf holds the symbol or not  
    (if (leaf? tree)
        (eq? sym (symbol-leaf tree))
        (let ((left-search-result (get-code (left-branch tree))))
          (cond ((is-valid-code? left-search-result) 
                  (cons 0 left-search-result))
                (left-search-result
                  (list 0))
                (else
                  (let ((right-search-result (get-code (right-branch tree))))
                    (cond ((is-valid-code? right-search-result)
                            (cons 1 right-search-result))
                          (right-search-result
                            (list 1))
                          (else false))))))))

  (let ((code (get-code tree)))
    (if (is-valid-code? code)
      code
      (error "Cannot encode" sym))))
