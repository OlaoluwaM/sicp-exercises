#lang sicp

(#%require string-interpolation)


(define (perimeter triangle)
  (let (
        (zYDist (point-dist (get-triangle-z-point triangle) (get-triangle-y-point triangle)))
        (zXDist (point-dist (get-triangle-z-point triangle) (get-triangle-x-point triangle)))
        (xYDist (point-dist (get-triangle-x-point triangle) (get-triangle-y-point triangle))))
    (+ zYDist zXDist xYDist))
  )

(define (area triangle)
  (define yTrianglePoint (get-triangle-y-point triangle))
  (define xTrianglePoint (get-triangle-x-point triangle))
  (define zTrianglePoint (get-triangle-z-point triangle))
  (let (
        (x1 (x-point yTrianglePoint))
        (y1 (y-point yTrianglePoint))
        (x2 (x-point xTrianglePoint))
        (y2 (y-point xTrianglePoint))
        (x3 (x-point zTrianglePoint))
        (y3 (y-point zTrianglePoint)))
    (* (+ (* x1 (- y2 y3)) (* x2 (- y3 y1)) (* x3 (- y1 y2)) ) 0.5))
  )

; -----------------------------------------------------------------------------

(define (point-dist p1 p2)
  (let ((x1 (x-point p1))
        (x2 (x-point p2))
        (y1 (y-point p1))
        (y2 (y-point p2)))
    (sqrt (square (- x1 x2)) (square (- y1 y2))))
  )

(define (square x) (* x x))

; -------------------------------------------------------------
; Where zPoint is the top point, while xPoint and yPoint are the bottom sides
;          z
;  x              y
(define (make-triangle xPoint yPoint zPoint) (cons (cons xPoint yPoint) zPoint))
(define (get-triangle-x-point triangle) (car (car triangle)))
(define (get-triangle-y-point triangle) (cdr (car triangle)))
(define (get-triangle-z-point triangle) (cdr triangle))

(define make-point cons)
(define x-point car)
(define y-point cdr)
