#lang sicp


(define (search-for-primes start stop) (search-for-primes-inner start stop))

(define (search-for-primes-inner current stop)
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

(define (report-prime n elapsed-time)
  (display n)
  (display " is prime")
  (display " *** ")
  (display "elapsed time (µs): ")
  (display elapsed-time)
  (newline)
  )

(define (report-not-prime n)
  (display n)
  (display " is not prime")
  (newline)
  )

(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))
  )

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

; Formalize all this into a readme

; The first thing we're asked to do is calculate the first smallest prime numbers greater than 1000, 10000, 100000, and 1000000.

; The next thing is the first hypothesis. We know that the procedure used to test primality with an order of growth of Θ(sqrt(n)), but is this really the case? And for every 10x increment in n, do we see a roughly proportional increase in runtime, that is, when we increase the input by a factor of 10, will the runtime also increase by a factor of sqrt(10)?


; (display (search-for-primes 1000 1020)) ; 1009, 1013, 1019
; (newline)
; (display (search-for-primes 10000 10040)) ; 10007, 10009, 10037
; (newline)
; (display (search-for-primes 100000 100050)) ; 100003, 100019, 100043
; (newline)
; (display (search-for-primes 1000000 1000050)) ; 1000003, 1000033, 1000037
; (newline)

; Since modern computers are hella fast, we might need to use larger inputs to test the time differences
; Lower Bound 1 * 10^8
(display (search-for-primes 100000000 100000020))
(display (search-for-primes 100000000 100000020))
(display (search-for-primes 100000000 100000020))
(display (search-for-primes 100000000 100000020))
(display (search-for-primes 100000000 100000020))
(newline)


; Lower Bound 1 * 10^9
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(newline)


; Lower Bound 1 * 10^{10}
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(newline)


; Lower Bound 1 * 10^{11}
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
