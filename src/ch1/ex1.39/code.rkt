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

(define (tan-cf x k)
  (cont-frac
   (lambda (i) (if (= i 1) x (* (square x) -1)))
   (lambda (i) (- (* 2.0 i) 1))
   k))

(define (square x) (* x x))

(define x 1.0)
(display (tan-cf x 8.0)) (newline)
(display (tan x)) (newline)
