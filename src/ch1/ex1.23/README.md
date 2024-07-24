# Exercise 1.23

## Question

The `smallest-divisor` procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5, 6, . . ., but rather 2, 3, 5, 7, 9, . . ..

To implement this change,

1. Define a procedure `next` that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the `smallest-divisor` procedure to use `(next test-divisor)` instead of `(+ test-divisor 1)`. With `timed-prime-test` incorporating this modified version of `smallest-divisor`, run the test for each of the 12 primes found in _Exercise 1.22_.

2. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2 (from being twice as fast)?

## Solution

1. Done in [code.rkt](code.rkt) in this directory
2. Why is the _faster_ algorithm not twice as fast if it computes with half the number of steps? It's not exactly half as fast, that is, the speed ratio is no exactly 2 because the `next` procedure used in the `faster` algorithm also introduces some additional steps such as a conditional expression and an extra function call.

  | ------------------ | ------------------------------------- | --------------------------------------- | ----------- | ----------------------------------------------------------------- |
  | Lower Bound        | Avg time with _faster_ algorithm (µs) | Avg time with _original_ algorithm (µs) | Speed Ratio | Notes                                                             |
  | $1\times{10^{9}}$  | 246.4                                 | 436.0                                   | 1.8         | Faster algorithm takes 56.51% less time, is 43.49% more efficient |
  | $1\times{10^{10}}$ | 761.6                                 | 1400.0                                  | 1.8         | Faster algorithm takes 54.40% less time, is 45.60% more efficient |
  | $1\times{10^{11}}$ | 2367.8                                | 4355.8                                  | 1.8         | Faster algorithm takes 54.36% less time, is 45.64% more efficient |
  | $1\times{10^{12}}$ | 7510.6                                | 14050.8                                 | 1.8         | Faster algorithm takes 53.45% less time, is 46.55% more efficient |
