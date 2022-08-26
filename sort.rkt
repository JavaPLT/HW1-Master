;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Insertion Sorting Program|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t quasiquote repeating-decimal #f #t none #f () #t)))
;; Sample HW Solution for problem to develop the function insert that sorts a list of numbers into ascending order

;;    You may delete this solution from your HW1 submission if you choose
;;    Clean solutions to some HW1 problems require the introduction of a few (perhaps one) auxiliary functions (like this example); others do not


;; A list-of-numbers is:
;; * the empty list: '()
;; * a composite list: (cons n lon)
;;   where n is a number and lon is a list-of-numbers

;; Template
#|
(define (lon-f ... lon ...)
  (if (empty? lon) ...
      ( ... (first lon) ... (lon-f ... (rest lon) ... ) )))
|#

;; i-sort: list-of-numbers -> (sorted) list-of-numbers
;; contract: given a list-of-numbers lon (possibly containing duplicates), (sort lon) returns a list containing the elements of lon in sorted order (possibly containing duplicates).
;; A list-of-numbers lon is sorted if the elements appear non-descending order.

;; Template Instantiation
#|
(define (i-sort lon)
  (if (empty? lon) ...
      (... (first lon) ... (i-sort (rest lon)) ...)))
|#

;; Examples
(check-expect (i-sort empty) empty)
(check-expect (i-sort '(7)) '(7))
(check-expect (i-sort '(1 2)) '(1 2))
(check-expect (i-sort '(2 3 1)) '(1 2 3))
(check-expect (i-sort '(2 2 0 3)) '(0 2 2 3))
(check-expect (i-sort '(7 6 5 4 3 2 1 -17 10)) '(-17 1 2 3 4 5 6 7 10))
;; Code
(define (i-sort lon)
  (if (empty? lon) empty
      (insert (first lon) (i-sort (rest lon)))))

;; Auxiliary Function
;; insert: number (sorted) list-of-number  -> (sorted) list-of-numbers
;; contract: given a number n and a sorted list-of-numbers lon, (insert n lon) returns the elements

;; Examples
(check-expect (insert 1 empty) '(1))
(check-expect (insert 2 '(0 3)) '(0 2 3))
(check-expect (insert 4 '(0 3)) '(0 3 4))
(check-expect (insert 0 '(1 2)) '(0 1 2))
(check-expect (insert 5 '(0 3 7 9)) '(0 3 5 7 9))

;; Template Instantiation
#|
(define (insert n lon)
  (if (empty? lon) ...
      ( ... n ... (first lon) ... (insert n (rest lon)))))
|#

;; Code:
(define (insert n lon)
  (if (empty? lon) (list n)
      (if (<= n (first lon)) (cons n lon)
          (cons (first lon) (insert n (rest lon))))))


             
          
