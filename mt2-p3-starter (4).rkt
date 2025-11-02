;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |mt2-p3-starter (4)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2023w2-mt2/mt2-p3) ;Do not edit or remove this tag

(@cwl ychen808)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

#|

Complete the design of the function below by writing the template origin tag
and the function definition.  

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED sums-up-to-naturals.
 - You MUST NOT COMMENT out any @ metadata tags.
 - You MUST NOT EDIT any part of the file above the line marked with ***.
 - You MUST FOLLOW all applicable design rules.
 - The file MUST NOT have any errors when the Check Syntax button is pressed.

 - The function definition MUST call one or more built-in abstract functions.

 - You must define a single top-level function with the given name. You are
   permitted to define helpers, but they must be defined within the the
   top-level function using local.

 - The function definition and any helper functions you design MUST NOT be
   recursive.

 - The result of the function must directly be the result of one of the
   built-in abstract functions. So, for example, the following would not
   be a valid function body:

       (define (foo x)
         (empty? (filter ...)))

   This would be a valid function body:

       (define (foo x)
         (local [(define (helper y) (foldr ... ... ...))]
           (helper ...)))

   

   For each element of the given list, produce the sum obtained by counting
   up from 1 until you reach the element. For example, given (list 1 3 6),
   the function should return (list 1 6 21), which is

   (list 1   ; = 1
         6   ; = 1 + 2 + 3            
         21) ; = 1 + 2 + 3 + 4 + 5 + 6 
   
   NOTE: Some of you may be familiar with a formula that will produce this
   sum for any given number, i.e. sum = (n * (n + 1)) / 2. DO NOT USE the
   formula! For maximum credit your answer will use three built-in abstract
   functions. We are assessing your ability to use built-in abstract
   functions, not your math knowledge!

|#

(@htdf sums-up-to-naturals)
(@signature (listof Natural) -> (listof Natural))
;; produce list of the sum from 1 to n for each n in given list
(check-expect (sums-up-to-naturals empty) empty)
(check-expect (sums-up-to-naturals (list 1 3 6)) (list 1 6 21)) 

;; *** MUST NOT EDIT ANY LINE ABOVE HERE ***

(define (sums-up-to-naturals lon)
  (local [(define (end n)
            (+ n 1))
          (define (sum-list? n)
            (foldr + 0 (build-list n end)))]
  (map sum-list? lon)))


