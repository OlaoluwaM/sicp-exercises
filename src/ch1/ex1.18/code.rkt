;; https://replit.com/@olaolum/sicp-workspace#ex1.17.scm

#lang sicp

(define (even? n) (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (fast-mult a b) (fast-mult-iter a b 0))
(define (fast-mult-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mult-iter (double a) (halve b) n))
        (else (fast-mult-iter a (- b 1) (+ n a)))))

;; Tests
(display (= (* 2 5) (fast-mult 2 5)))
(newline)
(display (= (* 2 15) (fast-mult 2 15)))
(newline)
(display (= (* 2 1) (fast-mult 2 1)))
(newline)
(display (= (* 2 20) (fast-mult 2 20)))
(newline)
(display (= (* 2 33) (fast-mult 2 33)))
(newline)
(display (= (* 8394433743 473487338) (fast-mult 8394433743 473487338)))
(newline)
