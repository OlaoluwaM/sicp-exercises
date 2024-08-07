#lang sicp

(define (carmichael-test n) (carmichael-test-inner 1 n))

(define (carmichael-test-inner a n)
  (if (= a n)
      true
      (and (congruency-check a n) (carmichael-test-inner (+ a 1) n))))

(define (congruency-check a n) (= (remainder (expt a n) n) (remainder a n)))

; Tests
(display (carmichael-test 561))
(newline)
(display (carmichael-test 1105))
(newline)
(display (carmichael-test 1729))
(newline)
(display (carmichael-test 2465))
(newline)
(display (carmichael-test 2821))
(newline)
(display (carmichael-test 6601))
(newline)
