# Exercise 1.26

## Question

Louis Reasoner is having great difficulty doing Exercise 1.24. His `fast-prime?` test seems to run more slowly than his `prime?` test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they ﬁnd that he has rewritten the `expmod` procedure to use an explicit multiplication, rather than calling `square`:

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))
```

“I don’t see what diﬀerence that could make,” says Louis. “I do.” says Eva. “By writing the procedure like that, you have transformed the Θ(log n) process into a Θ(n) process.” Explain.

## Solution

The inlining of the expression`(expmod base (/ exp 2) m)` results in the `expmod` needing to evaluate said expression twice instead of once as was the case when using `square` procedure. By inlining `square`, `expmod` will now need to recur on itself twice when the exponent is even. This might not seem like a huge deal at first glance, but can quickly lead to a degradation in performance as a result of the need to evaluate the redundant duplicate expression.

When using the `square` procedure, `expmod`  only needed to recur once, after it could perform the elementary operation of multiplication on the result of the `(expmod base (/ exp 2) m)` expression once it fully evaluates to a value
