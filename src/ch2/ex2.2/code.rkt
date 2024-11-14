#lang sicp

(#%require string-interpolation)

; Line segments in a plane. Segments are represented as a pair of points:

; A segment is a pair if points
(define make-segment cons)
(define end-segment cdr)
(define start-segment car)

; A point is a pair of numbers
(define make-point cons)
(define x-point car)
(define y-point cdr)

; line segment = ((x1, y1), (x2, y2))
(define (midpoint-segment line-segment)
  (let ((x1 (x-point (start-segment line-segment)))
        (x2 (x-point (end-segment line-segment)))
        (y1 (y-point (start-segment line-segment)))
        (y2 (y-point (end-segment line-segment))))
    (make-point (/ (+ x1 x2) 2.0) (/ (+ y1 y2) 2.0)))
  )

(define (print-point p)
  (display "(@{(x-point p)},@{(y-point p)})"))


(define (print-segment s)
  (display "[")
  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (display "]"))

; Tests
(define a (make-point 0 0))
(define b (make-point 0 2))
(define s (make-segment a b))
(define p1 (make-point 2 3))
(define p2 (make-point 5 6))
(define s1 (make-segment p1 p2))
(define test-p1 (make-point 1 1))
(define test-p2 (make-point 3 4))
(define test-segment (make-segment test-p1 test-p2))
(define test-midpoint (midpoint-segment test-segment))

(print-segment s1)
(newline)
(print-point (make-point 2 3))
(newline)
(print-point (midpoint-segment s1))
(newline)
(print-point test-midpoint)
(newline)
(print-point (midpoint-segment s))
(newline)
