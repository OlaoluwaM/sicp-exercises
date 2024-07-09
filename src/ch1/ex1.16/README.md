# Exercise 1.15

## Question

Design a procedure that evolves an iterative exponentiation process that uses successive squaring

## Answers

```scheme
(define (fast-expt b n) (fast-expt-iter b n 1))
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* b a)))))
```

I also liked how this procedure was designed here: <https://sicp-solutions.net/post/sicp-solution-exercise-1-16/>. Using math to inform the implementation was interesting.
