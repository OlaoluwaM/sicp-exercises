#lang sicp

(#%require string-interpolation)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x) (let ((dx 0.00001)) (/ (- (g (+ x dx)) (g x)) dx))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2))
     tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (display "guess: @{guess}") (newline)
    (let ((nextGuess (f guess)))
      (if (close-enough? guess nextGuess)
          nextGuess
          (try nextGuess))))
  (try first-guess))

(define (cubic a b c) (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define a 1)
(define b 1)
(define c 1)

(newtons-method (cubic a b c) 1)
