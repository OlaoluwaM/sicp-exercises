; Recursive
(define (f-recursive n)
  (if (< n 3) n (+ (f-recursive (- n 1))
    (* 2 (f-recursive (- n 2)))
    (* 3 (f-recursive (- n 3)))
  ))
)

; Tests
(display "Recursive")
(newline)
(display (f-recursive 0))
(newline)
(display (f-recursive 1))
(newline)
(display (f-recursive 2))
(newline)
(display (f-recursive 3))
(newline)
(display (f-recursive 4))
(newline)
(display (f-recursive 5))
(newline)
(display (f-recursive 6))
(newline)
(newline)

; Iterative
(define (f-iterative n)
  (define (f-loop a b c nPrime)
    (if (= n nPrime) a (f-loop (+ a (* 2 b) (* 3 c))  a b (+ nPrime 1)))
  )
  (if (< n 3) n (f-loop 2 1 0 2))
)

; Tests
(display "Iterative")
(newline)
(display (f-iterative 0))
(newline)
(display (f-iterative 1))
(newline)
(display (f-recursive 2))
(newline)
(display (f-iterative 3))
(newline)
(display (f-iterative 4))
(newline)
(display (f-iterative 5))
(newline)
(display (f-iterative 6))
(newline)
