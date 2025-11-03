;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |mt2-p2-starter (4)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2023w1-mt2/mt2-p2) ;Do not edit or remove this tag

(@cwl ychen808)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

#|

Complete the design of the function below by writing the template origin tag
and the function definition.  You must use one or more built in abstract
function(s) in your solution.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED circles.

 - You MUST NOT COMMENT out any @ metadata tags.

 - You MUST NOT EDIT any part of the file above the first line marked with ***.

 - You MUST FOLLOW all applicable design rules.

 - The file MUST NOT have any errors when the Check Syntax button is pressed.

 - The function definition MUST call one or more built-in abstract functions.

 - The function definition and any helper functions you design MUST NOT be
   recursive.

 - You must define a single top-level function with the given name. You are
   permitted to define helpers, but they must be defined within the the
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

(@htdf circles)
(@signature (listof Number) Color -> (listof (listof Image)))
;; for each n in lon, produce sub-list of n increasing size circles of color
(check-expect (circles empty "red") empty)
(check-expect (circles (list 3) "blue")
              (list (list (circle  0 "solid" "blue")
                          (circle  5 "solid" "blue")
                          (circle 10 "solid" "blue"))))
(check-expect (circles (list 3 4 2) "red")
              (list (list (circle  0 "solid" "red")
                          (circle  5 "solid" "red")
                          (circle 10 "solid" "red"))
                    (list (circle  0 "solid" "red")
                          (circle  5 "solid" "red")
                          (circle 10 "solid" "red")
                          (circle 15 "solid" "red"))
                    (list (circle  0 "solid" "red")
                          (circle  5 "solid" "red"))))

;; *** Must not edit any line above here. ***

;(define (circles lon color) empty) ;stub

(define (circles lon color)
  (local [(define (circ n)
            (circle n "solid" color))
          (define (circle*5 n)
            (circ (* 5 n)))
          (define (buildn n)
            (build-list n circle*5))]
    (map buildn lon)))
