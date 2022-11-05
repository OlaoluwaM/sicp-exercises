(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; We are conditionally determining the primitive procedure/operation to apply on operands `a` and `b`. The predicate here is whether `b` is an integer or a negative number. We are using a variation of a compound expression (special form) as the operator for the compound procedure
