(load "stream.scm")

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (cons-stream
            (apply proc (map stream-car argstreams))
            (apply stream-map
                   (cons proc (map stream-cdr argstreams))))))

(define (stream-enumerate-interval-step low high step)
    (if (> low high)
        the-empty-stream
        (cons-stream
            low
            (stream-enumerate-interval-step (+ low step) high step))))


(define (test)
    ;(stream-map + (<stream> 1 2 3) (<stream> 40 50 60) (<stream> 700 800 900))
    ;(741 852 963)
    (define stream1 (stream-enumerate-interval-step 1 3 1))
    (define stream2 (stream-enumerate-interval-step 40 60 10))
    (define stream3 (stream-enumerate-interval-step 700 900 100))

    (define res-stream (stream-map + 
                            stream1
                            stream2
                            stream3))
    (display res-stream)
    (newline)
    (if (and (= (stream-ref res-stream 0) 741)
             (= (stream-ref res-stream 1) 852)
             (= (stream-ref res-stream 2) 963))
        'test-passed
        (error "Failed")))
    