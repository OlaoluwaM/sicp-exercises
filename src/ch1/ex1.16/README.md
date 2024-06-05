# Exercise 1.15

## Question

Design a procedure that evolves an iterative exponentiation process that uses successive squaring

## Answers

```scheme
(define (fast-expt base exponent) (fast-expt-iter base exponent 1))
(define (fast-expt-iter base exponent oddChannelAccProduct)
  (cond ((= exponent 0) oddChannelAccProduct)
        ((even? exponent) (fast-expt-iter (square base) (/ exponent 2) oddChannelAccProduct))
        (else (fast-expt-iter base (- exponent 1) (* base oddChannelAccProduct)))))
```

I also liked how this procedure was designed here: <https://sicp-solutions.net/post/sicp-solution-exercise-1-16/>. Using math to inform the implementation was interesting.
