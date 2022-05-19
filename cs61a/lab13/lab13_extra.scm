; Q4
(define (rle s)
    (define (helper v cnt s) 
      (cond 
          ((null? s) (cons-stream (list v cnt) nil))
          ((equal? v (car s)) (helper v (+ cnt 1) (cdr-stream s)))
          (else (cons-stream (list v cnt) (helper (car s) 1 (cdr-stream s))))
      )
    )
    (if (null? s) nil (helper (car s) 1 (cdr-stream s)))
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
    (define (helper n prev suf)
      (if (null? suf) (append prev (list n))
        (if (< n (car suf))
            (append (if (null? prev) (list n) (append prev (list n))) suf)
            (helper n (append prev (list (car suf))) (cdr suf))
        )
      )
    )
    (helper n nil s)
)

; Q6
(define (deep-map fn s)
    (if (null? s) nil 
        (if (list? (car s))
            (cons (deep-map fn (car s)) (deep-map fn (cdr s)))
            (cons (fn (car s)) (deep-map fn (cdr s)))
        )
    )
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (unique s)
    (if (null? s) nil
        (cons (car s) (filter (lambda (x) (not (eq? (car s) x))) (unique (cdr s))))
    )
)

(define (count name s)
    (if (null? s) 0
        (if (eq? name (car s))
            (+ 1 (count name (cdr s)))
            (count name (cdr s))
        )
    )
)

(define (tally names)
    (map (lambda (x) (cons x (count x names))) (unique names))
)