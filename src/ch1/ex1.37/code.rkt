#lang sicp

(#%require string-interpolation)


(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (recur (+ i 1))))
        )
    )
  (recur 1)
  )

; Iterative solution with help from https://sicp-solutions.net/post/sicp-solution-exercise-1-37/
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))
        )
    )
  (iter (- k 1) (/ (n k) (d k)))
  )

(display "Recursive cont-frac: ")
(display (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 15))
(newline)
(display "Iterative cont-frac: ")
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 15))
(newline)
