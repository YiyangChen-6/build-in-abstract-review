
|#


;;
;; PROBLEM A
;;
(@htdf sum-of-some)

(@signature (Number -> Boolean) (listof Number) -> Number)
;; produce sum of just those numbers for which predicate produces true

(check-expect (sum-of-some odd? (list 7 1 4 5 6)) (+ 7 1 5))
(check-expect (sum-of-some negative? (list 2 -3 4)) -3)

;; *** Edit @template-origin and function definition below here.   ***
;; *** You may also add tests below here.                          ***

(@template-origin use-abstract-fn fn-composition)             ;uncomment and complete this tag

;(define (sum-of-some pred lon)   ;edit this fn definition to be correct
;  0)

(define (sum-of-some pred lon)
  (foldr + 0 (filter pred lon)))



;;
;; PROBLEM B
;;
(@htdf max-of-maxes)

(@signature (listof (listof Natural)) -> Natural)
;; Produce largest of all Naturals in all sub-lists. 0 if a list is empty.

(check-expect (max-of-maxes empty) 0)
(check-expect (max-of-maxes
               (list (list 1)
                     (list 2)))
              2)
(check-expect (max-of-maxes
               (list (list 1 3 7)
                     (list 9 2 4)
                     (list 4 2 5 1 5)))
              9)
(check-expect (max-of-maxes
               (list (list 9)
                     (list 5 2 4)
                     (list 4 2 5 8 1 5)))
              9)

;; *** Edit @template-origin and function definition below here.   ***
;; *** You may also add tests below here.                          ***


;(@template-origin use-abstract-fn fn-composition)             ;uncomment and complete this tag

(define (max-of-maxes lolon)     ;edit this fn definition to be correct
  (local [(define (largest? lon)
            (foldr max 0 lon))]
    (foldr max 0 (map largest? lolon))))



;;
;; PROBLEM C
;;
(@htdf max-input)

(@signature (X -> Number) (listof X) -> X)
;; Produce the list element for which fn produces the largest (>) output
;; CONSTRAINT: list is not empty

(check-expect (max-input identity (list 3 4 1)) 4)
(check-expect (max-input sqr (list 2 3 -5)) -5)
(check-expect (max-input string-length (list "abc" "d" "ef")) "abc")
(check-expect (max-input string-length (list "a" "xy" "ef" "d")) "xy")

;; *** Edit @template-origin and function definition below here.   ***
;; *** You may also add tests below here.                          ***


;(@template-origin )             ;uncomment and complete this tag

(define (max-input fn lox)
  (local [(define (largerst? x y)
            (if (>= (fn x) (fn y))
            x
            y))];edit this fn definition to be correct
    (foldr largerst? (first lox) (rest lox))))
