(define (mult a b)
  (define (mult-iter a b s)
    (cond ((= b 0) s)
          ((even? b) (mult-iter (double a) (halve b) s))
          (else (mult-iter a (- b 1) (+ s a)))))
  (mult-iter a b 0))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? a) (= 0 (remainder a 2)))
