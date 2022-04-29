(define (find s predicate)
    (if (null? s) False
        (if (predicate (car s)) (car s)
            (find (cdr-stream s) predicate)
        )
    )
)

(define (scale-stream s k)
    (if (null? s) nil
        (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
    )
)

(define (has-cycle s)
    (define (in? mem s)
        (cond
            ((null? mem) False)
            ((eq? (car mem) s) True)
            (else (in? (cdr mem) s))
        )
    )
    (define (has-cycle-helper mem s)
        (cond 
            ((null? s) False)
            ((in? mem s) True)
            (else (has-cycle-helper (cons s mem) (cdr-stream s)))
        )
    )
    (has-cycle-helper nil s)
)


(define (has-cycle-constant s)
    (define (has-cycle-helper fast slow)
        (cond
            ((null? fast) False)
            ((null? (cdr-stream fast)) False)
            ((null? slow) False)
            ((eq? fast slow) True)
            (else (has-cycle-helper (cdr-stream (cdr-stream fast)) (cdr-stream slow)))
        )
    )
    (cond
        ((null? s) False)
        ((null? (cdr-stream s)) False)
        (else (has-cycle-helper (cdr-stream (cdr-stream s)) (cdr-stream s)))
    )
)
