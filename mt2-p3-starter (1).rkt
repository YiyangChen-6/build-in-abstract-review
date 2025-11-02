;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |mt2-p3-starter (1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2024w2-mt2/mt2-p3) ;Do not edit or remove this tag

(@cwl ychen808)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line 

#|

Complete the design of the function below by writing the template origin tag
and the function definition.  You must use one or more built-in abstract
function(s) in your solution.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED select.

 - You MUST NOT COMMENT out any @ metadata tags.

 - You MUST NOT EDIT any part of the file above the first line marked with ***.

 - You MUST FOLLOW all applicable design rules.

 - The file MUST NOT have any errors when the Check Syntax button is pressed.

 - The function definition MUST call one or more built-in abstract functions.

 - The function definition and any helper functions you design MUST NOT be
   recursive.

 - You must define a single top-level function with the given name. You are
   permitted to define helpers, but they must be defined within the
   top-level function using local.

 - The result of the function must directly be the result of one of the
   built-in abstract functions. So, for example, the following would not
   be a valid function body because the result of the function of foo comes
   from empty? not filter.

       (define (foo x)
         (empty? (filter ...)))

   This would be a valid function body because the result of foo comes
   from foldr.

       (define (foo x)
         (local [(define (helper y) (foldr ... ... ...))]
           (helper ...)))

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






