# Exercise 1.18

## Question

Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.40

## Answers

```scheme
(define (fast-mult a b) (fast-mult-iter a b 0))
(define (fast-mult-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mult-iter (double a) (halve b) n))
        (else (fast-mult-iter a (- b 1) (+ n a)))))
```
