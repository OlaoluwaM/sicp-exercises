#lang sicp

(define (inc x) (+ x 1))


(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n) (product identity 1 inc n))
(define (factorial-iter n) (product-iter identity 1 inc n))

(define (wallis-product n)
  (define (term n) (* (/ (* 2 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1))))
  (product term 1.0 inc n)
  )

(define (wallis-product-iter n)
  (define (term n) (* (/ (* 2 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1))))
  (product-iter term 1.0 inc n)
  )

(display "With recursive product")
(newline)
(display (factorial 20))
(newline)
(display (wallis-product 10))
(newline)
(newline)

(display "With iterative product")
(newline)
(display (factorial-iter 20))
(newline)
(display (wallis-product-iter 10))
(newline)
