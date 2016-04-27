(load "huffman-tree.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))


(define (successive-merge leaf-set)
  (if (null? leaf-set)
      '()
      (let ((first (car leaf-set))
            (rest (cdr leaf-set)))
          (if (null? rest)
            first
            (successive-merge (adjoin-set (make-code-tree first (car rest)) (cdr rest)))))))


(define tree (generate-huffman-tree (list (list 'A 2) 
                                          (list 'NA 16) 
                                          (list 'BOOM 1) 
                                          (list 'SHA 3)
                                          (list 'GET 2)
                                          (list 'YIP 9)
                                          (list 'JOB 2)
                                          (list 'WAH 1))))

(load "encode-symbol.scm")

(define encoded (encode '(Get a job

                          Sha na na na na na na na na

                          Get a job

                          Sha na na na na na na na na

                          Wah yip yip yip yip yip yip yip yip yip

                          Sha boom) tree))

(define decoded (decode encoded tree))

(display encoded)
(newline)
(display decoded)