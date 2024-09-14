#lang sicp

(#%require string-interpolation)


(define (cont-frac n d k) (/ (n 1) (cont-frac-inner n d k 2)))

(define (cont-frac-inner n d k i)
  (if (= i k) (/ (n k) (d k)) (+ (d (- i 1)) (/ (n i) (cont-frac-inner n d k (+ i 1)))))
  )

; Iterative solution with help from https://sicp-solutions.net/post/sicp-solution-exercise-1-37/
(define (cont-frac-iter n d k)
  (define (iter i result) (if (= i 0) result (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter (- k 1) (/ (n k) (d k)))
  )

; Determined with help from https://sicp-solutions.net/post/sicp-solution-exercise-1-38/
(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2(/ (+ i 1) 3))
      1))

; 0.7182818267351813
(display (cont-frac (lambda (i) 1.0) d-euler 15))
(newline)
