#lang sicp

(#%require string-interpolation)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((g (gcd n d))
        (denom-sign (if (or (negative? d) (negative? n)) -1 1)))
    (cons (* (/ (abs n) g) denom-sign) (/ (abs d) g))))

(define numer car)
(define denom cdr)

(define (print-rat x)
  (display "@{(numer x)}/@{(denom x)}")
  (newline)
  )

; Tests
(print-rat (make-rat  -2 -4))
(print-rat (make-rat -2  4))
(print-rat (make-rat 2  -4))
(print-rat (make-rat 2  4))
