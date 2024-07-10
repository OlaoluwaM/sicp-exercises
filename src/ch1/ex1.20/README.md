# Exercise 1.20

## Question

Thee process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using
normal-order evaluation, as discussed in Section 1.1.5. (The normal-order-evaluation rule for `if` is described in Exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in
evaluating `(gcd 206 40)` and indicate the remainder operations that are actually performed.

How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?

## Answers

```scheme
#lang sicp

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))
```

### Normal-order evaluation

Expand the expression, evaluate sub-expressions only when needed. No sharing so duplicate sub-expressions will need to be re-evaluated from scratch as required.

We begin by expanding the expression `(gcd 206 40)` as follows:

```scheme
(gcd 206 40)

; expands to
(if (= 40 0) 206 (gcd 40 (remainder 206 40))))
```

We then evaluate the condition expression. Since it evaluates to `false`, only the `else` expression gets evaluated:

```scheme
; Condition is false, so only the `else` expression is evaluated, meaning
(gcd 40 (remainder 206 40))

; expands to
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
```

The conditional expression is _forced_, which in this case means that we evaluate the `(remainder 206 40)` sub-expression up until we can perform the comparison, so to normal form. This will proceed as follows:

```scheme
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; We evaluate 1 `remainder` expression (1):
(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
```

Since the condition is still `false`, ony the `else` expression will be evaluated, giving us:

```scheme
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; This will then expand to:
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd
     (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    )
```

Again, the conditional expression is _forced_, so evaluation occurs as follows:

```scheme
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd
     (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    )

; We evaluate two 2 `remainder` expressions

; (1)
(if (= (remainder 40 6) 0)
    (remainder 206 40)
    (gcd
     (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    )

; which then becomes (2)
(if (= 4 0)
    (remainder 206 40)
    (gcd
     (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    )
```

Once more, the condition evaluates to `false`, so only the `else` expression is evaluated, that is:

```scheme
(gcd
 (remainder 40 (remainder 206 40))
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 )

; expands to
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
)
```

The conditional expression is _forced_ once again, so evaluation proceeds as follows:

```scheme
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; We evaluate 4 `remainder` expressions:

; 1
(if (= (remainder 6 (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; which then becomes (2)
(if (= (remainder 6 (remainder 40 6)) 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; which then becomes (3)
(if (= (remainder 6 4) 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; which then becomes (4)
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
```

Again, the condition evaluates to `false`, so only the `else` expression is evaluated, giving us:

```scheme
(gcd
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 (remainder
  (remainder 40 (remainder 206 40))
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

; expands to
(if (= (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))
```

Once more, we _force_ the conditional expression:

```scheme
(if (= (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; We evaluate 7 `remainder` expressions

; 1
(if (= (remainder
        (remainder 40 6)
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; which then becomes (2)
(if (= (remainder 4 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; which then becomes (3)
(if (= (remainder 4 (remainder 6 (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; which then becomes (4)
(if (= (remainder 4 (remainder 6 (remainder 40 6))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; which then becomes (5)
(if (= (remainder 4 (remainder 6 4)) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; which then becomes (6)
(if (= (remainder 4 2) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; finally resolves to (7)
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))
```

The condition evaluates to `true`, thus only the `then` expression will be evaluated:

```scheme
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd
     (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
      )
     ))

; Only `then` expression is evaluated:
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

; This expression contains 4 `remainder` expression, all of which will be evaluated:

; 1
(remainder 6 (remainder 40 (remainder 206 40)))

; which then becomes (2)
(remainder 6 (remainder 40 6))

; which then becomes (3)
(remainder 6 4)

; finally, (gcd 206 40) will return (4)
2
```

Tallying up the number of times we evaluate a `remainder` expression, we get: **$1 + 2 + 4 + 7 + 4 = 18$**

### Applicative-order evaluation

Evaluate all sub-expressions fully first before evaluating the whole expression

We begin by applying the `gcd` procedure onto it's arguments, $206$ and $40$ as follows:

```scheme
(gcd 206 40)

; becomes
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
```

The condition expression evaluates to `false`, so only the `else` expression is evaluated:

```scheme
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))

; becomes
(gcd 40 (remainder 206 40))

; In the process we evaluate 1 `remainder` expression to get
(gcd 40 6)

; resulting in
(if (= 6 0) 40 (gcd 6 (remainder 40 6)))
```

The condition expression is once again `false`, so only the `else` expression is evaluated

```scheme
(if (= 6 0) 40 (gcd 6 (remainder 40 6)))

; simplifies to
(gcd 6 (remainder 40 6))

; We evaluate another `remainder` expression (1 `remainder` expression) to get
(gcd 6 4)

; resulting in
(if (= 4 0) 6 (gcd 4 (remainder 6 4)))
```

Once more, the condition expression evaluates to `false`, so only the `else` expression is evaluated:

```scheme
(if (= 4 0) 6 (gcd 4 (remainder 6 4)))

; simplifies to
(gcd 4 (remainder 6 4))

; We evaluate another `remainder` expression (1 `remainder` expression) to get
(gcd 4 2)

; resulting in
(if (= 2 0) 4 (gcd 2 (remainder 4 2)))
```

Yet again, the condition expression evaluates to `false`, so only the `else` expression is evaluated:

```scheme
(if (= 2 0) 4 (gcd 2 (remainder 4 2)))

; simplifies to
(gcd 2 (remainder 4 2))

; We evaluate another `remainder` expression (1 `remainder` expression) to get
(gcd 2 0)

; resulting in
(if (= 0 0) 2 (gcd 0 (remainder 2 0)))
```

In this case, the condition expression evaluates to `true`, so only the `then` expression is evaluated, yielding us the value `2` as the final answer. In the process, a total of **$4$** `remainder` expressions were evaluated

### Notes

It seems like, between the normal-order evaluation and the applicative order, the number of times a `remainder` expression is evaluated differs in a roughly exponential manner: 18 for normal order, 4 for applicative order. However, it is interesting to point out that if we were to use lazy evaluation rather than normal order evaluation, the _sharing_ that occurs in the former would make the number of evaluated `remainder` expressions closer to that of applicative order
