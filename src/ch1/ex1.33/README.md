# Exercise 1.33

## Question

You can obtain an even more general version of accumulate ([Exercise 1.32](../ex1.32/README.md)) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting `filtered-accumulate` abstraction takes the same arguments as `accumulate`, together with an additional predicate of one argument that specifies the filter. Write `filtered-accumulate` as a procedure. Show how to express the following using `filtered-accumulate`:

1. the sum of the squares of the prime numbers in the interval `a` to `b` (assuming that you have a prime? predicate already written)
2. the product of all the positive integers less than $n$ that are relatively prime to $n$ (i.e., all positive integers $i < n$ such that $GCD(i, n) = 1$).

## Solution

[Found here](code.rkt)
