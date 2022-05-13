;; Extra Scheme Questions ;;


; Q5
(define lst
    (cons (list 1) (cons 2 (cons (cons 3 4) (list 5))))
)

; Q6
(define (composed f g)
    (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
    (filter (lambda (x) (not (equal? x item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (gcd a b)
    (if (equal? (min a b) 0) (max a b)
        (if (equal? (remainder a b) 0) b
            (gcd b (remainder a b))
        )
    )
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q9
(define (no-repeats s)
    (if (null? s) nil
        (cons (car s)
            (no-repeats (filter (lambda (x) (not (= x (car s)))) (cdr s)))
        )
    )
)

; Q10
(define (substitute s old new)
    (cond 
        ((null? s)  nil)
        ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
        ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
        (else (cons (car s) (substitute (cdr s) old new)))
    )
)

; Q11
(define (sub-all s olds news)
    (if (null? olds) s 
        (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
    )
)