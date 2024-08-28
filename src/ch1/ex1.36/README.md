# Exercise 1.36

## Question

Modify `fixed-point` so that it prints the sequence of approximations it generates, using the newline and display primitives shown in [Exercise 1.22](../ex1.22/code.rkt).

1. Then ﬁnd a solution to $x^x = 1000$ by finding a fixed point of $x \mapsto log(1000)/log(x)$. (Use Scheme’s primitive log procedure, which computes natural logarithms.)
2. Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.)

## Solution

[code](code.rkt)

Number of steps with avg damping: 13
Number of steps without avg damping: 37

The average damping procedure was faster (took less steps) than the one without it.
