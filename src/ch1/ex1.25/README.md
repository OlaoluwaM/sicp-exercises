# Exercise 1.25

## Question

Alyssa P. Hacker complains that we went to a lot of extra work in writing `expmod`. After all, she says, since we already know how to compute exponentials, we could have simply written:

```scheme
(define (expmod base exp m) (remainder (fast-expt base exp) m))
```

Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

## Solution

She is correct in that we _could_ have used `fast-expt` in our definition of `expmod`. It would still allowed us to compute (with reasonable precision) whether a number is a prime, but it's a far less efficient implementation of `expmod` than what we had originally. This is chiefly because `fast-expt` is optimized for _even_ numbers (with which it operates with an order of growth of $\Theta{(log n)}$). Thus it isn't reasonable to make use of it in a context where our inputs will primarily be potential prime numbers that tend to be odd. For odd numbers, `fast-expt` has a linear order of growth as opposed to the logarithmic order of growth of the original implementation of `expmod`
