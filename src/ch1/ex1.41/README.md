# Exercise 1.41

## Question

Define a procedure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if `inc` is a procedure that adds `1` to its argument, then
`(double inc)` should be a procedure that adds `2`. What value is returned by

```scheme
(((double (double double)) inc) 5)
```

## Solution

[Solution](code.rkt)
