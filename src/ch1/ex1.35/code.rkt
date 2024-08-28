#lang sicp

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((nextGuess (f guess)))
      (if (close-enough? guess nextGuess)
          nextGuess
          (try nextGuess))))
  (try first-guess))


(define (round-to-places number places)
  (let* ((factor (expt 10 places))
         (rounded (* (round (* number factor)) (/ 1 factor))))
    rounded))

(define (fn x) (+ 1 (/ 1 x)))

(define golden-ratio-by-fixed-point (fixed-point fn 1.0))
(define dp 5)
(define golden-ratio-by-fixed-point-rounded (round-to-places golden-ratio-by-fixed-point dp))

; We need to round sicne we're dealing with approximations

(display "fixed-point golden ratio (rounded to 5 d.p): ")
(display golden-ratio-by-fixed-point-rounded)
(newline)

(display "Proof: ")
(display (= (round-to-places (fn golden-ratio-by-fixed-point) dp) golden-ratio-by-fixed-point-rounded))
(newline)
