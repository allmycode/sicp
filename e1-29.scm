(define (sim-rule f a b n)
  (define (sim-iter k h s)
    (if (< (+ a (* k h)) b)
        (sim-iter (+ k 1) h (+ s (* (if (even? k) 2 4) (f (+ a (* k h))))))
        s))
  (* (/ (/ (- b a) n) 3) (+ (f a) (f b) (sim-iter 1 (/ (- b a) n) 0))))

