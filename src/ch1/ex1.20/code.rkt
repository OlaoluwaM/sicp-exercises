#lang sicp

; Euclid's Algorithm for calculating the greatest common divisor between two numbers, a and b, in logarithmic time
(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

; 2
(display (gcd 206 40))
(newline)
