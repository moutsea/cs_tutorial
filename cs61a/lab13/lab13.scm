; Q1
(define (compose-all funcs)
    (define (dfs funcs x)
        (if (null? funcs) x
          (dfs (cdr funcs) ((car funcs) x))
        )
    )
    (lambda (x) 
        (dfs funcs x)
    )
)

; Q2
(define (tail-replicate x n)
    (define (dfs x n ret) 
      (if (= n 0) ret
          (dfs x (- n 1) (cons x ret))
      )
    )
    (dfs x n nil)
)