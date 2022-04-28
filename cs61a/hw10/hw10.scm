(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner 
          (term n)
          (accumulate combiner start (- n 1) term)
      )
  )
)

(define (accumulate-tail combiner start n term)
    ;(define (acc-helper combiner acc n term)
      (if (= n 0)
          start
          (accumulate-tail combiner (combiner (term n) start) (- n 1) term)
      )
    ;)
    ;(acc-helper combiner start n term)
)

(define-macro (list-of expr for var in seq if filter-fn)
    ;`(map (lambda (,var) ,expr) (filter (lambda (,var) ,filter-fn) ,seq))
    (list 'map (list 'lambda (list var) expr) (list 'filter (list 'lambda (list var) filter-fn) seq))
)