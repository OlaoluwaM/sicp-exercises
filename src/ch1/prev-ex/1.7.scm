(define (sqrt x)
(sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
(if (good-enough? guess (improve guess x))
guess
(sqrt-iter (improve guess x) x)))

(define (improve guess x)
(average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (square x) (* x x))

; Produces a correct output
(print (sqrt 897996785585865555555555555555675747545646))
(print (sqrt 0.00000000000000000001))
