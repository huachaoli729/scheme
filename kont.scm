;   Given a tripcode representation of a knot diagram as input, performs Reidemeister
;    moves of Types I and II, printing a list of moves performed, followed by a message
;    that the tangle is an unknot if the resulting tripcode is empty, and returning the 
;    value of the resulting tripcode
 
(define untangle tc)
  (cond
      ((null? tc) #t)
      ((hastwist tc) (untangle (remove-twist tc)))
      (untangle (twist-process tc))
      ((hasslide tc) (untangle (remove-slide tc)))
      (untangle (silde-process tc))
      ((null? tc) (display The tangle is an unknot.) #t)
      (display tc)
  )
)

;;; To test if has twist
(define hastwist tc)
  (cond
  ((=  (car '(car ' tc)) (car '(cadr ' (tc)))) #t)
  (#f))

;;; To remove the twist
(define remove-twist tc)
  (cond
    ((display TWIST) (car '(car ' tc)))
    ((cdr (cdr tc)))
    
    
;;; To skip the untwisted part
(define twist-process tc)
  (cond
     
    (cdr tc))



;; To test if has slide
(define hasslide tc)
  (cond
  ((=  (cadr '(car ' tc)) (cadr ' (cadr ' tc))) #t)
  (#f))

;;; To remove the slide
(define remove-slide tc)
  (cond
    ((display SLIDE) (car '(car ' tc)) car(,) (car '(cadr ' tc)))
    ((cdr (cdr tc)))
    
    
/* To skip the unslided part
(define slide-process tc)
  (cond
    (cdr tc))