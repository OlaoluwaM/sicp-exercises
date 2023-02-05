; Recursive
(define (f n)
    (cond ((< n 3) n)
         (else (+ (f (- n 1))
                  (* 2 (f (- n 2)))
                  (* 3 (f (- n 3)))))))

; Iterative
(define (f-iter n) (
  (cond ((< n 3) n)
        (else ()))
))
