(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
    (define (concat s)
        (cons first s)
    )
    (map concat rests)
)

(define (zip pairs)
    (list (map car pairs) (map cadr pairs))
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
    (define (enum-iter n s)
        (if (null? s) 
          nil
          (cons
              (list n (car s))
              (enum-iter (+ n 1) (cdr s))
          )
        )
    )
    (enum-iter 0 s)
)

  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
    (define (use-denom total denoms) (list-change (- total (car denoms)) denoms))
    (define (not-use-denom total denoms) (list-change total (cdr denoms)))
    (cond 
        ((null? denoms) nil)
        ((eq? total 0) (cons nil nil))
        ((< total (car denoms)) (list-change total (cdr denoms)))
        (else 
            (append (cons-all (car denoms) (use-denom total denoms)) (not-use-denom total denoms))
        )
    )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
          expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
          expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
            (cons form (cons params (let-to-lambda body)))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
            (define combine (zip values))
            (cons 
                (cons 'lambda (cons (let-to-lambda (car combine)) (cons (let-to-lambda (car body)) nil))) 
                (map let-to-lambda (cadr combine))
            )
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
            (cons (car expr) (map let-to-lambda (cdr expr)))
         ; END PROBLEM 19
         )))