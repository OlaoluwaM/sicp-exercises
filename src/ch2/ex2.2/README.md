# Exercise 2.2

## Question

Consider the problem of representing line segments in a plane.

1. Each segment is represented as a pair of points: a starting point and an ending point. Define a constructor `make-segment` and selectors `start-segment` and `end-segment` that define the representation of segments in terms of points.
2. Furthermore, a point can be represented as a pair of numbers: the $x$ coordinate and the $y$ coordinate. Accordingly, specify a constructor `make-point` and selectors `x-point` and `y-point` that define this representation.
3. Finally, using your selectors and constructors, define a procedure `midpoint-segment` that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints). To try your procedures, you’ll need a way to print points

## Solution

[Solution](code.rkt)
