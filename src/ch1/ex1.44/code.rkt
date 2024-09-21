#lang sicp

(#%require string-interpolation)

(define (repeated f call-count)
  (lambda (x) (if (= call-count 0) x (f ((repeated f (- call-count 1)) x))))
  )

(define dx 0.00001)

(define (smooth f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3) ))

(define (smooth-nth f n) ((repeated smooth n) f))
