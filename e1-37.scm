(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
  (cont-frac-rec 1))

(define (cont-frac n d k)
  (define (cont-frac-iter i s)
    (if (= 0 i)
        s
        (cont-frac-iter (- i 1)
                        (/ (n i) (+ (d i) s)))))
  (cont-frac-iter k 0))

;; #1.38
(define (eiler i)
  (if (= 0 (remainder (+ i 1) 3))
      (* 2.0 (/ (+ i 1) 3))
      1.0))

(define (dsquare x)
  (lambda (i)  (- 0 (square x))))

(define (square x) (* x x))

(define (tg-n i)
  (+ 1 (* i 2.0)))

(define (tan-cf x k)
  (/ x (+ 1 (cont-frac (dsquare x) tg-n k))))
