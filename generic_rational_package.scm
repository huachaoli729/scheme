; THE GENERIC RATIONAL PACKAGE

; Methods for rationals.

;   (RepRat, RepRat) --> ({rational} X RepRat)
(define (+rational x y) (make-rational (+rat x y)))
(define (-rational x y) (make-rational (-rat x y)))
(define (*rational x y) (make-rational (*rat x y)))
(define (/rational x y) (make-rational (/rat x y)))

;   RepRat --> ({rational} X RepRat)
(define (negate-rational x) (make-rational (negate-rat x)))

;   RepRat --> Bool
(define (=zero-rational? x) (=zero-rat? x))

;   RepRat --> ({rational} X RepRat)
(define (make-rational x) (attach-tag 'rational x))


; Install the rational methods in the generic operations.

(put 'add '(rational rational) +rational)
(put 'sub '(rational rational) -rational)
(put 'mul '(rational rational) *rational)
(put 'div '(rational rational) /rational)

(put 'negate '(rational) negate-rational)
(put '=zero? '(rational) =zero-rational?)


; Rational Package User Interface

; A convenient procedure for building a generic rational
; from generic numbers.

;;;    (GN, GN) --> ({rational} X RepRat)
(define (create-rational x y)
   (make-rational (make-rat x y)))