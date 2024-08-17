#lang sicp
(#%require (lib "27.ss" "srfi"))


(define (prime-test n) (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (miller-rabin-test n)
  (define (try-it a) (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random-integer (- n 1)))))

; expmod = base^exp % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (square-check (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))


(define (square-check x m)
  (define val (square x))
  (if (and (not (or (= x 1) (= x (- m 1))))
           ;f is congruent to z modulo n
           ; Meaning f modulo n = z
           ; In this case f = x^2 and z = 1
           (= (remainder val m) 1))
      0
      (remainder val m)))

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(prime-test 1009)
(prime-test 1013)
(prime-test 1019)
(prime-test 10007)
(prime-test 10009)
(prime-test 10037)
(prime-test 561)
