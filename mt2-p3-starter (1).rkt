
|#

(@htdf select)
(@signature Natural String -> (listof (listof 1String)))
;; produce a list of n list of 1String selecting increasing s string characters
;; CONSTRAINT: n <= string length of s + 1  
(check-expect (select 0 "hi") empty)
(check-expect (select 4 "doggy")
              (list (list ) 
                    (list "d")
                    (list "d" "o")
                    (list "d" "o" "g")))
(check-expect (select 6 "doggy")
              (list (list ) 
                    (list "d")
                    (list "d" "o")
                    (list "d" "o" "g")
                    (list "d" "o" "g" "g")
                    (list "d" "o" "g" "g" "y")))

;; *** Must not edit any line above here. ***
(@template-origin use-abstract-fn fn-composition)
;(define (select n s) empty);stub
#; (define (select n s)
     (build-list n (lambda (n) (build-list n (lambda (n) (substring s n (+ n 1)))))))


(define (select n s)
  (local [(define (fn n)
            (substring s n (add1 n)))
          (define (fn2 n)
            (build-list n fn))]
    (build-list n fn2)))






