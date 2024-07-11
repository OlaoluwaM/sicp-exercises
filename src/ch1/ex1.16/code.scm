#lang sicp

; https://replit.com/@olaolum/sicp-workspace#ex1.16.scm

(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

;; Recursive definition
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Iterative definition

(define (fast-expt-i b n) (fast-expt-iter b n 1))
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* b a)))))

;; Tests
(display (= (fast-expt 2 5) (fast-expt-i 2 5)))
(newline)
(display (= (fast-expt 2 15) (fast-expt-i 2 15)))
(newline)
(display (= (fast-expt 2 1) (fast-expt-i 2 1)))
(newline)
(display (= (fast-expt 2 20) (fast-expt-i 2 20)))
(newline)
(display (= (fast-expt 2 33) (fast-expt-i 2 33)))
(newline)
