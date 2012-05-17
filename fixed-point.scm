(define fix
  (lambda (f guess)
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            guess
            (try next))))
    (try guess)))

(define (close-enough? x fx)
  (let ((delta 0.00001))
    (< (abs (- x fx)) delta)))
