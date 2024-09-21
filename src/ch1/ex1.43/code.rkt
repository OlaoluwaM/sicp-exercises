#lang sicp

(#%require string-interpolation)

(define (repeated f call-count)
  (lambda (x) (if (= call-count 0) x (f ((repeated f (- call-count 1)) x))))
  )

(define (square x) (* x x))

((repeated square 2) 5)
; 625
