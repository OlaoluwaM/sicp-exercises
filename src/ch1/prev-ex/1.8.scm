(define (cube-root x)
(cube-root-iter 1.0 x))

(define (cube-root-iter guess x)

(if (good-enough? (improve guess x) guess)
guess
(cube-root-iter (improve guess x) x))

)

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (good-enough? guess prev-guess)
  (<= (/ (abs (- prev-guess guess)) guess) 0.000000000000000000000000000001)
)

(define (square x) (* x x))

(define (cube x) (* (square x) x))

(cube-root (cube 12947))
