; THE TERM LIST ARITHMETIC PACKAGE.

; procedures for dealing with lists of terms in order of 
; descending powers.

;   (RepTerms, RepTerms) --> RepTerms

(define (add-terms L1 L2)
  (cond ((empty-termlist? L1) L2)
        ((empty-termlist? L2) L1)
        (else
         (let ((t1 (first-term L1)) (t2 (first-term L2)))
           (cond ((> (order t1) (order t2))
                  (adjoin-term t1
                               (add-terms (rest-terms L1) L2)))
                 ((< (order t1) (order t2))
                  (adjoin-term t2
                               (add-terms L1 (rest-terms L2))))
                 (else
                  (adjoin-term (make-term (order t1)
                                          (add (coeff t1)
                                               (coeff t2)))
                               (add-terms (rest-terms L1)
                                       (rest-terms L2)))))))))

(define (mul-terms L1 L2)
  (if (empty-termlist? L1)
      (the-empty-termlist)
      (add-terms (mul-term-by-all-terms (first-term L1) L2)
              (mul-terms (rest-terms L1) L2))))


;;;   (RepTerm, RepTerms) --> RepTerms
(define (mul-term-by-all-terms t1 L)
  (map-terms (lambda (term) (mul-term t1 term)) L))



; Procedures for Representing Term Lists.

; RepTerms =  Empty-Term-List  U  (RepTerm X RepTerms)

;   constructor of type (RepTerm, RepTerms) --> RepTerms

(define (adjoin-term term term-list)
  (if (=zero? (coeff term))                ;slight simplification
      term-list
      (cons term term-list)))


;   constructor of type  EmptyType --> RepTerms
(define (the-empty-termlist) '())

; selectors

;   RepTerms --> RepTerm
(define (first-term term-list) (car term-list))

;   RepTerms --> RepTerms
(define (rest-terms term-list) (cdr term-list))

;   RepTerms --> Bool
(define (empty-termlist? term-list) (null? term-list))


;  THE TERM ARITHMETIC PACKAGE

;   RepTerm = Sch-NatNum X GN

;   (Sch-NatNum, GN) --> RepTerm
(define (make-term order coeff) (list order coeff))

;   RepTerm --> Sch-NatNum
(define (order term) (car term))

;   RepTerm --> GN
(define (coeff term) (cadr term))

;;;   (RepTerm, RepTerm) --> RepTerm
(define (mul-term t1 t2)
  (make-term
   (+ (order t1) (order t2))
   (mul (coeff t1) (coeff t2))))

; APPLYING POLYNOMIALS

(define (apply-term t gn)
  (mul (coeff t)
       (power gn (order t))))

(define (power gn k)
  (if (< k 1)
      (create-number 1)
      (mul gn (power gn (dec k)))))

(define (apply-polynomial p gn)
  (apply-terms
   (term-list (contents p))
   gn))