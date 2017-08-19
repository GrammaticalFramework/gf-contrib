#lang racket
(require ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))


; Access to the libraries

(define-ffi-definer define-pgf (ffi-lib "libpgf"))
(define-ffi-definer define-gu  (ffi-lib "libgu"))



; Gu functions and types

(define _gu-pool* (_cpointer 'GuPool))
(define _gu-exn* (_cpointer 'GuExn))
(define _gu-enum* (_cpointer/null 'GuEnum))
(define _gu-variant (make-ctype _pointer #f #f))
(define-cstruct _gu-variant-info
  ([tag_ _int]
   [data _pointer]))
(define _gu-in* (_cpointer 'GuIn))
(define _gu-out* (_cpointer 'GuOut))
(define _gu-string-buf* (_cpointer 'GuStringBuf))


(define-gu gu_new_pool (_fun -> _gu-pool*))
(define-gu gu_pool_free (_fun _gu-pool* -> _void))
(define-gu gu_local_pool_ (_fun -> _gu-pool*))
(define-gu gu_new_exn (_fun _gu-pool* -> _gu-exn*))
(define-gu gu_variant_open (_fun _gu-variant -> _gu-variant-info))
(define-gu gu_enum_next (_fun _gu-enum* _pointer _gu-pool* -> _void))
(define-gu gu_string_buf (_fun _gu-pool* -> _gu-string-buf*))
(define-gu gu_string_buf_out (_fun _gu-string-buf* -> _gu-out*))
(define-gu gu_string_buf_freeze (_fun _gu-string-buf* _gu-pool* -> _string))
(define-gu gu_data_in (_fun _string _int _gu-pool* -> _gu-in*))
(define-gu gu_exn_is_raised(_fun _gu-exn* -> _bool))





; pgf types

(define _pgf-expr (make-ctype _gu-variant #f #f))
(define _pgf-cid (make-ctype _string #f #f))
(define-cstruct _pgf-exp-pb
  ([prob _float]
   [expr _pgf-expr]))
(define-cstruct _pgf-application
  ([fun _pgf-cid]
   [n_args _int]
   [args (_array _pgf-expr 1)]))

(define _pgf-pgf* (_cpointer 'PgfPGF))
(define _pgf-concr* (_cpointer/null 'PgfConcr))
(define _pgf-exp-pb* _pgf-exp-pb-pointer/null)

(define-cstruct _pgf-expr-app
  ([fun _pgf-expr]
   [arg _pgf-expr]))

(define _expr-tag (_enum '(abs app lit meta fun var typed impl-args num-tags)))
(define _literal-tag (_enum '(string int float)))

(define (get-variant-info-tag ei  [type #f])
  (let ([t (gu-variant-info-tag_ ei)])
    (if type (cast t _int type) t)))

(define-cstruct _pgf-expr-fun
  ([fun (_bytes o 0)]))

(define-cstruct _pgf-expr-lit
  ([lit _gu-variant]))

(define-cstruct _pgf-literal-str
  ([val (_bytes o 0)]))
(define-cstruct _pgf-literal-int
  ([val _int]))



; Enum functions




(define (enum-next type enum pool)
  (let ([t*
         (cast (malloc type) _pointer (_cpointer type))])
    (gu_enum_next enum t* pool)
    (ptr-ref t* type)))
