# Exercise 1.14

## Question

Draw the tree illustrating the process generated by the count-change procedure of Section 1.2.2 in making change for 11 cents. What are the orders of growth of the space and number of steps used by this process as the amount to be changed increases?

## Solution

Using the Graphviz framework (is that what it's called?), I was able to render this call graph for invoking the function with 11 cents

```graphviz
digraph countingChange {
  node [shape = record;];

  // CC stands for coutingChange
  "CC 11  [50, 25, 10, 5, 1]" -> "CC 11 [25, 10, 5, 1]";
  "0_1" [label = "0";];
  "CC 11  [50, 25, 10, 5, 1]" -> "CC -39 [50, 25, 10, 5, 1]" -> "0_1";

  "CC 11 [25, 10, 5, 1]" -> "CC 11 [10, 5, 1]";
  "0_2" [label = "0";];
  "CC 11 [25, 10, 5, 1]" -> "CC -14 [25 10, 5, 1]" -> "0_2";

  "CC 11 [10, 5, 1]" -> "CC 11 [5, 1]";
  "CC 11 [10, 5, 1]" -> "CC 1 [10, 5, 1]";

  "CC 1 [10, 5, 1]" -> "CC 1 [5, 1]";
  "0_3" [label = "0";];
  "CC 1 [10, 5, 1]" -> "CC -9 [10, 5, 1]" -> "0_3";

  "CC 1 [5, 1]" -> "CC 1 [1]";
  "0_4" [label = "0";];
  "CC 1 [5, 1]" -> "CC -4 [5, 1]" -> "0_4";

  "0_5" [label = "0";];
  "CC 1 [1]" -> "CC 1 []" -> "0_5";
  "1_1" [label = "1";color = red;];
  "CC 1 [1]" -> "CC 0 [1]" -> "1_1";

  "CC 11 [5, 1]" -> "CC 11 [1]";
  "CC 11 [5, 1]" -> "CC 6 [5, 1]";

  "1_2" [label = "1";color = red;];
  "CC 11 [1]" -> "CC 11 []" -> "1_2";
  "CC 11 [1]" -> "CC 10 [1]";

  "CC 6 [5, 1]" -> "CC 6 [1]";
  "CC 6 [5, 1]" -> "CC 1 [5, 1] ";

  "0_6" [label = "0";];
  "CC 6 [1]" -> "CC 6 []" -> "0_6";
  "CC 6 [1]" -> "CC 5 [1]";

  "0_7" [label = "0";];
  "CC 5 [1]" -> "CC 5 []" -> "0_7";
  "CC 5 [1]" -> "CC 4 [1]";

  "0_8" [label = "0";];
  "CC 4 [1]" -> "CC 4 []" -> "0_8";
  "CC 4 [1]" -> "CC 3 [1]";

  "0_9" [label = "0";];
  "CC 3 [1]" -> "CC 3 []" -> "0_9";
  "CC 3 [1]" -> "CC 2 [1]";

  "0_10" [label = "0";];
  "CC 2 [1]" -> "CC 2 []" -> "0_10";
  "CC 2 [1]" -> "CC 1 [1] ";

  "0_11" [label = "0";];
  "CC 1 [1] " -> "CC 1 [] " -> "0_11";
  "1_3" [label = "1";color = red;];
  "CC 1 [1] " -> "CC 0 [1] " -> "1_3";

  "0_12" [label = "0";];
  // Abridged here because the subgraph for "CC 10 [1]" will follow the same
  // structure as that of "CC 6 [1]". It'll just be longer
  "CC 10 [1]" -> "..." -> "CC 1 []  " -> "0_12";
  "1_4" [label = "1";color = red;];
  "CC 10 [1]" -> "... " -> "CC 0 [1]  " -> "1_4";
}
```

For its space complexity, we know that for tree recursive processes the space complexity is roughly proportional to the maximum depth of the resulting tree created when the process is visualized.

In this case, we know that the maximum depth would equal the longest chain/subtree, which would occur from deductions on the original amount using the smallest denomination. As to why this is the case, I don't really have a compelling answer, this kinda just makes sense vOv. For instance, deducting pennies, one at a time, from a 100 cents would definitely lead to a longer call graph than deducting either cents or quarters from the same amount.

Thinking along these lines, I think we can further generalize this thought to say that the maximum depth in this case would be proportional to the original amount divided by the smallest denomination. If we consider the original amount to be $n$ and the "smallest denomination" to be some constant value (since it won't change or need to be computed during the lifetime of the process) $a$, we could say that the space complexity would be roughly proportional to $n/a$ which simplifies to just $n$ for our purposes.

Thus we can conclude that the space complexity for this algorithm is linear $O(n)$

As for the time complexity more investigation is needed. I find that the best way to investigate would be to graph the `count-change` function with a strategic set of inputs (amounts, and tokens)