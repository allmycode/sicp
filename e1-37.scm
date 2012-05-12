(define (cont-frac d n k)
  (define (cont-frac-rec i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
  (cont-frac-rec 1))

(define (cont-frac d n k)
  (define (cont-frac-iter i s)
    (if (= 0 i)
        s
        (cont-frac-iter (- i 1)
                        (/ (n i) (+ (d i) s)))))
  (cont-frac-iter k 0))
