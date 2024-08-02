#lang sicp
(#%require (lib "27.ss" "srfi"))

(define (timed-prime-test n) (start-prime-test n (runtime)))

(define (timed-prime-test-alt n) (start-prime-test-alt n (runtime)))

(define (start-prime-test n start-time)
  ; The number of *times* we specify will affect the outcome somewhat
  ; So I don't think we can easily compare fast-prime? to prime?
  (if (fast-prime? n 50)
      (report-prime n (- (runtime) start-time))
      ))

(define (start-prime-test-alt n start-time)
  ; The number of *times* we specify will affect the outcome somewhat
  ; So I don't think we can easily compare fast-prime? to prime?
  (if (fast-prime-alt? n 50)
      (report-prime n (- (runtime) start-time))
      ))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fast-prime-alt? n times)
  (cond ((= times 0) true)
        ((fermat-test-alt n) (fast-prime-alt? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fermat-test-alt n)
  (define (try-it a) (= (expmod-alt a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (expmod-alt base exp m) (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

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

; logarithmic order of growth (fast)
(display "Without fast-expt")
(newline)
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(newline)

; linear order of growth because inputs are odd numbers (slow)
(display "With fast-expt")
(newline)
(timed-prime-test-alt 1009)
(timed-prime-test-alt 1013)
(timed-prime-test-alt 1019)
(timed-prime-test-alt 10007)
(timed-prime-test-alt 10009)
(timed-prime-test-alt 10037)
(timed-prime-test-alt 100003)
(timed-prime-test-alt 100019)
(timed-prime-test-alt 100043)
(timed-prime-test-alt 1000003)
(timed-prime-test-alt 1000033)
(timed-prime-test-alt 1000037)
