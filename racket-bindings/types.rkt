#lang racket
(require ffi/unsafe
          ffi/unsafe/define)

(provide (all-defined-out))


; Access to the libraries

(require racket/runtime-path)
(define-runtime-path HERE ".")
(define (c-libs)
  (list (build-path HERE 'up "c/.libs") HERE))
(define-ffi-definer define-pgf (ffi-lib #:get-lib-dirs c-libs "libpgf"))
(define-ffi-definer define-gu  (ffi-lib #:get-lib-dirs c-libs "libgu"))
(define-ffi-definer define-enum (ffi-lib #:get-lib-dirs c-libs "enums"))



; Gu functions and types

(define _gu-pool* (_cpointer 'GuPool))
(define _gu_exn* (_cpointer 'GuExn))
(define _gu-enum* (_cpointer/null 'GuEnum))
(define _gu-variant (make-ctype _pointer #f #f))
(define-cstruct _gu-variant-info
  ([tag_ _int]
   [data _pointer]))

(define-gu gu_new_pool (_fun -> _gu-pool*))
(define-gu gu_local_pool_ (_fun -> _gu-pool*))
(define-gu gu_new_exn (_fun _gu-pool* -> _gu_exn*))
(define-gu gu_variant_open (_fun _gu-variant -> _gu-variant-info))



; pgf types

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

(define _expr-tag (_enum '(abs app lit meta fun var typed impl-args num-tags)))
(define _literal-tag (_enum '(string int float)))

(define (get-variant-info-tag ei  [type #f])
  (let ([t (gu-variant-info-tag_ ei)])
    (if type (cast t _int type) t)))

(define-cstruct _pgf-expr-fun
  ([fun (_bytes/len 25)]))

(define-cstruct _pgf-expr-lit
  ([lit _gu-variant]))

(define-cstruct _pgf-literal-str
  ([val _string]))
(define-cstruct _pgf-literal-int
  ([val _int]))



; Enum functions

(define-enum next_exp (_fun _gu-pool* _gu-enum* -> _pgf-exp-pb*))