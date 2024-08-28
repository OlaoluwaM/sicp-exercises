#lang sicp

(#%require string-interpolation)

(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point output f first-guess)
  (define (try guess count)
    ; (output "guess (@{count}): @{guess}")
    ; (newline)
    (let ((nextGuess (f guess)))
      ; (output "nextGuess (@{count}): @{nextGuess}")
      ; (newline)
      (if (close-enough? guess nextGuess)
          (and (output "result (took @{count} recursive calls). ") nextGuess)
          (try nextGuess (+ count 1)))))
  (try first-guess 1))


(define (round-to-places number places)
  (let* ((factor (expt 10 places))
         (rounded (* (round (* number factor)) (/ 1 factor))))
    rounded))

(define (average x y)
  (/ (+ x y) 2))

(define (fn x) (/ (log 1000) (log x)))
(define (fn-with-average-damping x) (average x (/ (log 1000) (log x))))

(define dp 4)

(newline)
(display "Approx fixed point: @{(fixed-point display fn 1.1)}")
(newline)
(newline)


(display "Approx fixed point with average damping: @{(fixed-point display fn-with-average-damping 1.1)}")
(newline)
(newline)

(define approx-fixed-point (fixed-point identity fn 1.1))
(define approx-fixed-point-w-avg-damping (fixed-point identity fn-with-average-damping 1.1))

; We need to round sicne we're dealing with approximations
(display "Proofs")
(newline)
(display (= (round-to-places (fn approx-fixed-point) dp) (round-to-places approx-fixed-point dp)))
(newline)
(display (= (round-to-places (fn-with-average-damping approx-fixed-point-w-avg-damping) dp) (round-to-places approx-fixed-point dp)))
(newline)
