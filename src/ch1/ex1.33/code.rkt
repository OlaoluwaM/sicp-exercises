#lang sicp


(define (sum-of-prime-squares a b) (predicate-sum prime? square a inc b))

(define (product-of-relative-primes n)
  (define (predicate? i) (= (gcd i n) 1))
  (predicate-product predicate? identity 1 inc (- n 1))
  )

(define (predicate-sum predicate? term a next b) (predicate-accumulate + 0 predicate? term a next b))

(define (predicate-product predicate? term a next b) (predicate-accumulate * 1 predicate? term a next b))

(define (predicate-accumulate combiner null-value predicate? term a next b)
  (cond ((> a b)  null-value)
        ((predicate? a) (combiner (term a) (predicate-accumulate combiner null-value predicate? term (next a) next b)))
        (else (combiner null-value (predicate-accumulate combiner null-value predicate? term (next a) next b)))))


(define (inc a) (+ a 1))

(define (prime? n) (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))
  )

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(display "Sum of prime squares: ")
(display (sum-of-prime-squares 1 10))
(newline)
(display "Product of relative primes: ")
(display (product-of-relative-primes 10))
(newline)
