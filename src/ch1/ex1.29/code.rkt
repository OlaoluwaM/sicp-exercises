#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))


(define (inc a) (+ a 1))
(define (cube a) (* a a a))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpsons f a b n)
  (define h (/ (- b a) n))
  (define (categorizeSeqTerm k seqTerm) (if (even? k) (* 2 seqTerm) (* 4 seqTerm)))
  (define (innerFn k) (categorizeSeqTerm k (f (+ a (* k h)))))
  (* (+ (f a) (sum innerFn 1 inc (- n 1)) (f b)) (/ h 3)))

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
