;; Replit Link https://replit.com/@olaolum/DeterminedStableSubversion

(define (cube x) (* x x x))
(define (p x)(- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(display (sine 12.15))
(newline)

;; (sine 12.15)
;; (p (sine 4.05)
;; (p (p (sine 1.349)))
;; (p (p (p (sine 0.449))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.499))))))
;; (p (p (p (p (p 0.0499)))))
;; (p (p (p (p 0.01495))))
;; (p (p (p 0.043513)))
;; (p (p 0.97584))
;; (p -0.78956)
;; -0.399803

; Another version that I like from here: https://sicp-solutions.net/post/sicp-solution-exercise-1-15/
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle step)
  (display step) (display ": ") (display angle) (newline)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0) (+ step 1)))))

(display (sine 12.15 1))
(newline)
