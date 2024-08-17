#lang sicp

(define (inc a) (+ a 1))
(define (cube a) (* a a a))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (product term a next b) (accumulate * 1 term a next b))

(define (product-iter term a next b) (accumulate-iter * 1 term a next b))

(define (sum term a next b) (accumulate + 0 term a next b))

(define (sum-iter term a next b) (accumulate-iter + 0 term a next b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-iter f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-iter f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpsons f a b n)
  (define h (/ (- b a) n))
  (define (categorizeSeqTerm k seqTerm) (if (even? k) (* 2 seqTerm) (* 4 seqTerm)))
  (define (innerFn k) (categorizeSeqTerm k (f (+ a (* k h)))))
  (* (+ (f a) (sum innerFn 1 inc (- n 1)) (f b)) (/ h 3)))

(define (integral-simpsons-iter f a b n)
  (define h (/ (- b a) n))
  (define (categorizeSeqTerm k seqTerm) (if (even? k) (* 2 seqTerm) (* 4 seqTerm)))
  (define (innerFn k) (categorizeSeqTerm k (f (+ a (* k h)))))
  (* (+ (f a) (sum-iter innerFn 1 inc (- n 1)) (f b)) (/ h 3)))

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


(display "With recursive sum using accumulate")
(newline)
(display (integral cube 0 1 0.01))
(newline)
(display(integral cube 0 1 0.001))
(newline)
(newline)

(display (integral-simpsons cube 0 1.0 100))
(newline)
(display (integral-simpsons cube 0 1.0 1000))
(newline)
(display (integral-simpsons cube 0 1.0 10000))
(newline)
(display (integral-simpsons cube 0 1.0 100000))
(newline)
(newline)

(display "With iterative sum using accumulate-iter")
(newline)
(display (integral-iter cube 0 1 0.01))
(newline)
(display(integral-iter cube 0 1 0.001))
(newline)
(newline)

(display (integral-simpsons-iter cube 0 1.0 100))
(newline)
(display (integral-simpsons-iter cube 0 1.0 1000))
(newline)
(display (integral-simpsons-iter cube 0 1.0 10000))
(newline)
(display (integral-simpsons-iter cube 0 1.0 100000))
(newline)
(newline)
(newline)

(display "With recursive product using accumulate")
(newline)
(display (factorial 20))
(newline)
(display (wallis-product 10))
(newline)
(newline)

(display "With iterative product using accumulate-iter")
(newline)
(display (factorial-iter 20))
(newline)
(display (wallis-product-iter 10))
(newline)
