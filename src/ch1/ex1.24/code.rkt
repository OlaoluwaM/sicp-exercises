#lang sicp
(#%require (lib "27.ss" "srfi"))

(define (search-for-primes current stop)
  (cond ((>= current stop) "")
        ((odd? current) (check-prime current stop))
        (else (search-for-primes (+ current 1) stop)))
  )

(define (check-prime current stop)
  (timed-prime-test current)
  (search-for-primes (+ current 2) stop)
  )

(define (timed-prime-test n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      ))

(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))
  )

(define (timed-prime-test-fermat n) (start-prime-test-fermat n (runtime)))

(define (start-prime-test-fermat n start-time)
  ; The number of *times* we specify will affect the outcome somewhat
  ; So I don't think we can easily compare fast-prime? to prime?
  (if (fast-prime? n 20)
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
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

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
(timed-prime-test-fermat 1009)
(timed-prime-test-fermat 1013)
(timed-prime-test-fermat 1019)
(newline)

(timed-prime-test-fermat 10007)
(timed-prime-test-fermat 10009)
(timed-prime-test-fermat 10037)
(newline)

(timed-prime-test-fermat 100003)
(timed-prime-test-fermat 100019)
(timed-prime-test-fermat 100043)
(newline)

(timed-prime-test-fermat 1000003)
(timed-prime-test-fermat 1000033)
(timed-prime-test-fermat 1000037)
(newline)
(newline)
(newline)

; Not getting a 2x increase between input of 1*10^6 and 1*10^12 :(
; 1*10^6
(timed-prime-test-fermat 1000039)
(newline)
; 1*10^12
(timed-prime-test-fermat 1000000000039)
