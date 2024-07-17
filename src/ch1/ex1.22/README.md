# Exercise 1.22

## Question

Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following `timed-prime-test` procedure, when called with an integer `n`, prints `n` and checks to see if `n` is prime. If `n` is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

```scheme
(define (timed-prime-test n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      ))

(define (report-prime n elapsed-time)
  (display n)
  (display " is prime")
  (display " *** ")
  (display "elapsed time (µs): ")
  (display elapsed-time)
  (newline)
  )
```

1. Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. Use your procedure to ﬁnd the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime.

2. Since the testing algorithm has order of growth $\Theta{(\sqrt{n})}$, you should expect that testing for primes around 10,000 should take about $\sqrt{10}$ times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the $\Theta{(\sqrt{n})}$ prediction?

3. Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

## Solution

1. Code solution can be found in the [code.rkt](code.rkt) file in this directory.
2. The results are close enough to support the $\Theta{(\sqrt{n})}$ prediction. Inspiration for the table above was gotten from [here](https://www.timwoerner.de/posts/sicp/exercises/1/22/)

    | Lower Bound        | Expected (μs) | Actual (μs) | Relative Error (%) |
    | ------------------ | ------------- | ----------- | ------------------ |
    | $1\times{10^9}$    | 174.56        | 175.4       | 0.48               |
    | $1\times{10^{10}}$ | 554.66        | 553.8       | 0.16               |
    | $1\times{10^{11}}$ | 1751.27       | 1755.2      | 0.22               |

3. Yes, the results seem compatible. Programs run in time roughly proportional to the theoretic number of steps required for the computation as denoted by the order of growth
