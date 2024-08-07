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
