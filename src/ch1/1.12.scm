; To get the value at the specified index in the specified row, we sum the value of the entry at the previous index in the previous with the value of the entry at the same indeex in the previous row

(define (pascal row entry)
  (cond ((= row entry) 1)
        ((= entry 1) 1)
        ((< entry 1) 0)
        ((< row 0) 0)
        ((> entry row) 0)
        (else (+ (pascal (- row 1) (- entry 1)) (pascal (- row 1) entry)))
        ))
