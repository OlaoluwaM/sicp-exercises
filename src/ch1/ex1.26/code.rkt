#lang sicp
(#%require (lib "27.ss" "srfi"))


(define (timed-prime-test n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  ; The number of *times* we specify will affect the outcome somewhat
  ; So I don't think we can easily compare fast-prime? to prime?
  (if (fast-prime? n 5)
      (report-prime n (- (runtime) start-time))
      ))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

(define (report-prime n elapsed-time)
  (display n)
  (display " is prime")
  (display " *** ")
  (display "elapsed time (µs): ")
  (display elapsed-time)
  (newline)
  )

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(display "Using the 'fermat' algorithm")
(newline)
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(newline)

(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(newline)

(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(newline)

(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(newline)

; It's easier to observe changes in timing with larger inputs
(display "Examples for viewing the order of growth")
(newline)
(timed-prime-test 1000039)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)
(newline)

(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
(newline)

(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(newline)

(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)
(newline)

(timed-prime-test (+ (expt 10 9) 9))
(timed-prime-test (+ (expt 10 18) 9))
(newline)

(timed-prime-test (+ (expt 10 6) 33))
(timed-prime-test (+ (expt 10 12) 39))
