
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


