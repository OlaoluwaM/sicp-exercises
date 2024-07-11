;; https://replit.com/@olaolum/sicp-workspace#ex1.17.scm

#lang sicp

(define (even? n) (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

;; Tests
(display (= (* 3 5) (mult 3 5)))
(newline)
(display (= (* 4 5) (mult 4 5)))
(newline)
(display (= (* 2 7) (mult 2 7)))
(newline)
(display (= (* 9 9) (mult 9 9)))
(newline)
(display (= (* 10 28) (mult 10 28)))
(newline)
(display (= (* 132230 245438) (mult 132230 245438)))
(newline)
(display (= (mult 3 5) (fast-mult 3 5)))
(newline)
(display (= (mult 4 5) (fast-mult 4 5)))
(newline)
(display (= (mult 2 7) (fast-mult 2 7)))
(newline)
(display (= (mult 9 9) (fast-mult 9 9)))
(newline)
(display (= (mult 10 28) (fast-mult 10 28)))
(newline)
(display (= (mult 132230 245438) (fast-mult 132230 245438)))
(newline)
