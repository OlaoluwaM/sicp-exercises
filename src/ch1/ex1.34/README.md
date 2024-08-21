# Exercise 1.34

## Question

Suppose we define the procedure

```scheme
(define (f g) (g 2))

; Then we have
(f square)
; 4

(f (lambda (z) (* z (+ z 1))))
; 6
```

What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)`? Explain.

## Solution

We will get an error because `2` would not be considered a procedure. When we apply `f` to `f`, we would be binding `2` to `g` which happens when `f` is applied to `2`, which is the case when we apply `f` to itself. During the next invocation of `f`, we will get a runtime error because `2` would have been bound to `g`, and applying `2` onto itself (through `g`) will result in an error.
