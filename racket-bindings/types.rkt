#lang racket
(require ffi/unsafe)

(provide (all-defined-out))

(define _gu-variant (make-ctype _pointer #f #f))
(define-cstruct _gu-variant-info
  ([tag_ _int]
   [data _pointer]))
(define _pgf-expr (make-ctype _gu-variant #f #f))
(define _pgf-cid (make-ctype _string #f #f))
(define-cstruct _pgf-exp-pb
  ([prob _float]
   [expr _pgf-expr]))
(define-cstruct _pgf-application
  ([fun _pgf-cid]
   [n_args _int]
   [args _pointer]))

(define _pgf-pgf* (_cpointer 'PgfPGF))
(define _pgf-concr* (_cpointer/null 'PgfConcr))
(define _pgf-exp-pb* _pgf-exp-pb-pointer/null)
(define _gu-pool* (_cpointer 'GuPool))
(define _gu_exn* (_cpointer 'GuExn))
(define _gu-enum* (_cpointer/null 'GuEnum))

(define-cstruct _pgf-expr-app
  ([fun _pgf-expr]
   [arg _pgf-expr]))

(define (_bytes/len n)
  (make-ctype (make-array-type _byte n)

              ;; ->c
              (lambda (v)
                (unless (and (bytes? v) (= (bytes-length v) n))
                  (raise-argument-error '_chars/bytes 
                                        (format "bytes of length ~a" n)
                                        v))
                v)

              ;; ->racket
              (lambda (v)
                (make-sized-byte-string v n))))

(define-cstruct _pgf-expr-fun
  ([fun (_bytes/len 25)]))

(define-cstruct _pgf-expr-lit
  ([lit _gu-variant]))

(define-cstruct _pgf-literal-str
  ([val (_bytes/len 50)]))
(define-cstruct _pgf-literal-int
  ([val _int]))



