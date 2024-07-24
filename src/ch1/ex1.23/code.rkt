#lang sicp

(define (search-for-primes-faster current stop)
  (cond ((>= current stop) "")
        ((odd? current) (check-prime-faster current stop))
        (else (search-for-primes-faster (+ current 1) stop)))
  )

(define (check-prime-faster current stop)
  (timed-prime-test-faster current)
  (search-for-primes-faster (+ current 2) stop)
  )

(define (search-for-primes current stop)
  (cond ((>= current stop) "")
        ((odd? current) (check-prime current stop))
        (else (search-for-primes (+ current 1) stop)))
  )

(define (check-prime current stop)
  (timed-prime-test current)
  (search-for-primes (+ current 2) stop)
  )

(define (timed-prime-test-faster n) (start-prime-test-faster n (runtime)))

(define (timed-prime-test n) (start-prime-test n (runtime)))

(define (start-prime-test-faster n start-time)
  (if (prime-faster? n)
      (report-prime n (- (runtime) start-time))
      ))

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

(define (prime-faster? n) (= n (smallest-divisor-faster n)))

(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor-faster n) (find-divisor-faster n 2))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor-faster n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-faster n (next test-divisor))))
  )

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))
  )

(define (next n) (if (= n 2) 3 (+ n 2)))

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))


; First question
; Since the inputs here are so small, differences in time might not be so obvious. It's also
; possible that because input sizes are so small (relatively speaking, remember computers have
; come a long way in terms of speed since the original inception of this book), the number of steps
; taken by both the original and faster algorithm could be very similar regardless of the differences
; in order of growth between the algorithms

; (display "Using the 'faster' algorithm")
; (newline)
; (timed-prime-test-faster 1009)
; (timed-prime-test-faster 1013)
; (timed-prime-test-faster 1019)
; (newline)

; (timed-prime-test-faster 10007)
; (timed-prime-test-faster 10009)
; (timed-prime-test-faster 10037)
; (newline)

; (timed-prime-test-faster 100003)
; (timed-prime-test-faster 100019)
; (timed-prime-test-faster 100043)
; (newline)

; (timed-prime-test-faster 1000003)
; (timed-prime-test-faster 1000033)
; (timed-prime-test-faster 1000037)
; (newline)

; (display "Using the original algorithm")
; (newline)
; (timed-prime-test 1009)
; (timed-prime-test 1013)
; (timed-prime-test 1019)
; (newline)

; (timed-prime-test 10007)
; (timed-prime-test 10009)
; (timed-prime-test 10037)
; (newline)

; (timed-prime-test 100003)
; (timed-prime-test 100019)
; (timed-prime-test 100043)
; (newline)

; (timed-prime-test 1000003)
; (timed-prime-test 1000033)
; (timed-prime-test 1000037)


; Second question
; The differences in the number of steps required become more apparent as input size increases

; Lower Bound 1 * 10^{9}
(display "Using the 'faster' algorithm, 1*10^9")
(newline)
(display (search-for-primes-faster 1000000000 1000000008))
(display (search-for-primes-faster 1000000000 1000000008))
(display (search-for-primes-faster 1000000000 1000000008))
(display (search-for-primes-faster 1000000000 1000000008))
(display (search-for-primes-faster 1000000000 1000000008))
(newline)

(display "Using the original algorithm, 1*10^9")
(newline)
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(display (search-for-primes 1000000000 1000000008))
(newline)
(newline)

; Lower Bound 1 * 10^{10}
(display "Using the 'faster' algorithm, 1*10^10")
(newline)
(display (search-for-primes-faster 10000000000 10000000020))
(display (search-for-primes-faster 10000000000 10000000020))
(display (search-for-primes-faster 10000000000 10000000020))
(display (search-for-primes-faster 10000000000 10000000020))
(display (search-for-primes-faster 10000000000 10000000020))
(newline)

(display "Using the original algorithm, 1*10^10")
(newline)
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(display (search-for-primes 10000000000 10000000020))
(newline)
(newline)

; Lower Bound 1 * 10^{11}
(display "Using the 'faster' algorithm, 1*10^11")
(newline)
(display (search-for-primes-faster 100000000000 100000000005))
(display (search-for-primes-faster 100000000000 100000000005))
(display (search-for-primes-faster 100000000000 100000000005))
(display (search-for-primes-faster 100000000000 100000000005))
(display (search-for-primes-faster 100000000000 100000000005))
(newline)

(display "Using the original algorithm, 1*10^11")
(newline)
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(display (search-for-primes 100000000000 100000000005))
(newline)
(newline)

; Lower Bound 1 * 10^{12}
(display "Using the 'faster' algorithm, 1*10^12")
(newline)
(display (search-for-primes-faster 1000000000000 1000000000040))
(display (search-for-primes-faster 1000000000000 1000000000040))
(display (search-for-primes-faster 1000000000000 1000000000040))
(display (search-for-primes-faster 1000000000000 1000000000040))
(display (search-for-primes-faster 1000000000000 1000000000040))
(newline)

(display "Using the original algorithm, 1*10^12")
(newline)
(display (search-for-primes 1000000000000 1000000000040))
(display (search-for-primes 1000000000000 1000000000040))
(display (search-for-primes 1000000000000 1000000000040))
(display (search-for-primes 1000000000000 1000000000040))
(display (search-for-primes 1000000000000 1000000000040))
