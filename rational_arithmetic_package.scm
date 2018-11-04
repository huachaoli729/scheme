; THE RATIONAL ARITHMETIC PACKAGE.

;   (RepRat, RepRat) --> RepRat

(define (+rat x y)
  (make-rat (add (mul (numer x) (denom y))
                 (mul (denom x) (numer y)))
            (mul (denom x) (denom y))))

(define (-rat x y)
  (make-rat (sub (mul (numer x) (denom y))
                 (mul (denom x) (numer y)))
            (mul (denom x) (denom y))))

(define (*rat x y)
  (make-rat (mul (numer x) (numer y))
            (mul (denom x) (denom y))))

(define (/rat x y)
  (make-rat (mul (numer x) (denom y))
            (mul (denom x) (numer y))))


;   RepRat --> RepRat

(define (negate-rat x)
  (make-rat (negate (numer x))
            (denom x)))

;   RepRat --> Bool

(define (=zero-rat? x)
  (=zero? (numer x)))


; Procedures for representing rationals

;   (GN, GN) --> RepRat
(define (make-rat numerator denominator)
  (cons numerator denominator))

;   RepRat --> GN
(define numer car)
(define denom cdr)

; Coercion procedure from rational/rational method
; to number/rational method

;  ((RepRat,RepRat) --> T) --> ((RepNum,RepRat) --> T)
(define (RRmethod->NRmethod method)
  (lambda (num rat)
    (method
     (repnum->reprat num)
     rat)))