# Exercise 1.24

## Question

1. Modify the timed-prime-test procedure of Exercise 1.22 to use `fast-prime?` (the Fermat method), and test each of the 12 primes you found in that exercise.

2. Since the Fermat test has Θ(log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you ﬁnd?

## Solution

1. Done in [code.rkt](code.rkt) in this directory
2. $log(1000000) - log(1000) = log(1000)$. Therefore, we could say that $log(1000000) = log(1000) + log(1000)$ or  $log(1000000) = log(1000) * 2$. Thus we expect the amount of time to test primes near 1,000,000 to be double the amount of time required to test primes near 1000. My results do not seem to support this theory. Why? Well the reason seems to be because arithmetic operations on arbitrarily sized integers are not constant time. Where in the world did arbitrarily sized integers come from? Well, due to the sheer power of modern computers, relative to what the was available at the time this book was published, we aren't properly able to observe the order of growth of the algorithm using the integers specified in the question. My CPU barely sweats.
   1. We need to use larger inputs to better observe the order of growth. Because modern CPUs are so beefy, *larger* means really large numbers which tend to fall into the category of arbitrarily sized numbers. Unfortunately once you enter this territory you no longer have arithmetic operations as valid *elementary operations* that can be counted as constant measures of time
   2. More info can be found [here](https://cs.stackexchange.com/questions/1643/how-can-we-assume-that-basic-operations-on-numbers-take-constant-time)
