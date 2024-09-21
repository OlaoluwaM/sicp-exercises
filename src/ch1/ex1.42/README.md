# Exercise 1.42

## Question

Let $f$ and $g$ be two one-argument functions. The composition $f$ after $g$ is defined to be the function $x \mapsto f(g(x))$. Define a procedure `compose` that implements composition. For example, if `inc` is a procedure that adds 1 to its argument

```scheme
((compose square inc) 6)
; 49
```

## Solution

[Solution](code.rkt)
