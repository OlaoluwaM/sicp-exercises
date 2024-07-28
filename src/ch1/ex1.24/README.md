# Exercise 1.24

## Question

1. Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise.

2. Since the Fermat test has Θ(log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear
this out? Can you explain any discrepancy you ﬁnd?

## Solution

1. Done in [code.rkt](code.rkt) in this directory
2. $log(1000000) / log(1000) = 2$ (assuming natural logarithms). Thus we expect the amount of time to test primes near 1,000,000 to be double the amount of time to test primes near 1000
