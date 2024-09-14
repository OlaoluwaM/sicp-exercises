# Exercise 1.37

## Question

An inﬁnite continued fraction is an expression of the form

  $$
  f = \cfrac{N_1}{D_1 + \cfrac{N_2}{D_2 + \cfrac{N_3}{D_3 + \cdots}}}
  $$

As an example, one can show that the infinite continued fraction expansion with the $N_i$ and the $D_i$ all equal to $1$ produces $\frac{1}{\Phi}$, where $\Phi$ is the golden ratio (described in Section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation—a so-called k-term finite continued fraction—has the form

  $$
  f = \cfrac{N_1}{D_1 + \cfrac{N_2}{\cdots + \cfrac{N_k}{D_k}}}
  $$

Suppose that $n$ and $d$ are procedures of one argument (the term index $i$) that return the $N_i$ and $D_i$ of the terms of the continued fraction.

1. Define a procedure `cont-frac` such that evaluating `(cont-frac n d k)` computes the value of the k-term finite continued fraction. Check your procedure by approximating $\frac{1}{\Phi}$ using `(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)` for successive values of `k`. How large must you make `k` in order to get an approximation that is accurate to $4$ decimal places?

2. If your `cont-frac` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

## Solution

1. `k` must be at least 15 to approximate $1/\phi$ accurately to 4 decimal places
2. [code](code.rkt)
