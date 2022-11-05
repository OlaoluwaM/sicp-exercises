#|
Got some help from the following places
- http://community.schemewiki.org/?sicp-ex-1.3
- https://stackoverflow.com/questions/161666/sicp-exercise-1-3-request-for-comments
|#

(define (square x) (* x x) )

(define (sumSquares x y) (+ (square x) (square y)) )

(define (getMax x y) (if (>= x y) x y))

; x y
; x z
; z y

(define (sumTwoLargestNums x y z) (
      cond ((>= x y) (sumSquares x (getMax y z)))
            ((>= z x) (sumSquares z (getMax x y)))
))

(sumTwoLargestNums 1 2 3)
 ;Value: 13
 (sumTwoLargestNums 1 1 1)
 ;Value: 2
 (sumTwoLargestNums 1 2 2)
 ;Value: 8
 (sumTwoLargestNums 1 1 2)
 ;Value: 5
 (sumTwoLargestNums 1 4 3)
 ;Value: 25
 (sumTwoLargestNums 0 0 0)
 ; Value: 0
 (sumTwoLargestNums 5 0 -1)
 ; Value: 25
