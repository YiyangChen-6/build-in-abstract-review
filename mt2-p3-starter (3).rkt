;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |mt2-p3-starter (3)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2024w1-mt2/mt2-p3)

(@cwl ychen808)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

#|

YOU ARE NOT PERMITTED TO USE THE STEPPER AT ANY POINT IN THIS EXAM.

In this problem you must complete the design of one function using built-in
abstract functions.

NOTE there are three choices below, marked A, B and C. Your grade for this
problem will be:

 (max (* 0.70 <GRADE-FOR-A>) (* 0.85 <GRADE-FOR-B>) (* 1.00 <GRADE-FOR-C>))

So it is a maximum of weighted scores, with
 - the first  function being worth  70% credit
 - the second function being worth  85% credit
 - the third  function being worth 100% credit

You may do one function or two or all three.  If you do more than one your
scores will not be added, the max will be chosen. But remember the file must
check-syntax. Don't let errors with one problem prevent the others from
grading at all.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - The file MUST NOT have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - Failing tests in the functions you don't complete will not count against
    your mark.

  - The function definitions MUST call one or more built-in abstract functions.

  - Any helper functions must be defined inside the main function using local.

  - The function definitions and any helper functions you design MUST NOT be
    recursive.

  - The function definitions and helper functions you design MUST NOT use any
    part of the recursive Natural template or the (listof X) template. For
    instance,

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere

  - You MUST NOT edit the first part of any function design. Only add a
    @template origin and function definition. You MAY but are not required
    to add check-expects. You may not in any way edit existing check-expects.

  - The result of any function must directly be the result of one of the
    built-in abstract functions. So, for example, the following would not
    be a valid function body:

       (define (foo x)
         (empty? (filter ...)))

AGAIN, you only need to design one function. You MAY design more than one if
you like, but your grade will come from the best weighted score.

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
