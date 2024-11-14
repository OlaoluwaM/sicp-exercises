#lang sicp

(#%require string-interpolation)


(define (perimetr rectangle)
  (let ((len (rectangle-length rectangle))
        (width (rectangle-width rectangle)))
    (+ (* len 2) (* width 2))))

(define (area rectangle)
  (let ((len (rectangle-length rectangle))
        (width (rectangle-width rectangle)))
    (* len width)))

(define (rectangle-length rectangle) (point-dist (get-point-a rectangle) (get-point-b rectangle)))

(define (rectangle-width rectangle) (point-dist (get-point-a rectangle) (get-point-c rectangle)))

; -------------------------------------------
; line segment = ((x1, y1), (x2, y2))
(define (midpoint-segment line-segment)
  (let ((x1 (x-point (start-segment line-segment)))
        (x2 (x-point (end-segment line-segment)))
        (y1 (y-point (start-segment line-segment)))
        (y2 (y-point (end-segment line-segment))))
    (make-point (/ (+ x1 x2) 2.0) (/ (+ y1 y2) 2.0)))
  )

(define (point-dist p1 p2)
  (let ((x1 (x-point p1))
        (x2 (x-point p2))
        (y1 (y-point p1))
        (y2 (y-point p2)))
    (sqrt (+ (square (- x1 x2)) (square (- y1 y2))) ))
  )

(define (square x) (* x x))

;---------------------------------------

; We define a rectange as a pair of line segments
; A                    B
;
;
; C                    D
; [(A, B), (C, D)]
(define (make-rectangle pointA pointB pointC pointD)
  (let ((firstSegment (make-segment pointA pointB))
        (secondSegment (make-segment pointC pointD)))
    (cons firstSegment secondSegment)))

(define (get-point-a rectangle) (start-segment (start-segment rectangle)))
(define (get-point-b rectangle) (end-segment (start-segment rectangle)))
(define (get-point-c rectangle) (start-segment (end-segment rectangle)))
(define (get-point-d rectangle) (end-segment (end-segment rectangle)))

; -----------------------------------
; Line segments in a plane. Segments are represented as a pair of points:

; A segment is a pair if points
(define make-segment cons)
(define end-segment cdr)
(define start-segment car)

; A point is a pair of numbers
(define make-point cons)
(define x-point car)
(define y-point cdr)

; Tests

(define A (make-point 0 3))
(define B (make-point 4 3))
(define C (make-point 0 0))
(define D (make-point 4 0))

(define rec1 (make-rectangle A B C D))

(display "Perimeter: @{(perimetr rec1)}")
(newline)
(display "Area: @{(area rec1)}")
