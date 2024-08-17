#lang sicp

(define (inc a) (+ a 1))
(define (cube a) (* a a a))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


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

(display "With recursive sum")
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

(display "With iterative sum")
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
