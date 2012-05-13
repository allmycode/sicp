(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k) (f (+ a (* h k))))
  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            ((odd? k) 4)) (y k)))
  (* (/ h 3) (sum term 0 inc n)))

(define (even? x) (= 0 (remainder x 2)))
(define (odd? x) (not (even? x)))

(simpson cube 0 1 10.)
