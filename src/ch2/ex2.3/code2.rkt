#lang sicp

(#%require string-interpolation)


(define (perimeter rectangle)
  (let ((len (rectangle-length rectangle))
        (width (rectangle-width rectangle)))
    (+ (* len 2) (* width 2))))

(define (area rectangle)
  (let ((len (rectangle-length rectangle))
        (width (rectangle-width rectangle)))
    (* len width)))

(define rectangle-length get-length)

(define rectangle-width get-width)


; We define a rectange as a pair of length and width
; (length, width)
(define make-rectangle cons)
(define get-length car)
(define get-width cdr)
