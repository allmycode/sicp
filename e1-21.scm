(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (square x) (* x x))

;;;
(define (prime? n)
  (= (smallest-divisor n) n))

;;; ferma
(define (expmod base exp n)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) n)) n))
        (else (remainder (* base (expmod base (- exp 1) n)) n))))

(define (even? b)
  (= (remainder b 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
