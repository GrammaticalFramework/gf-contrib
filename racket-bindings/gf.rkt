#lang racket/base
(require ffi/unsafe
         ffi/unsafe/define
         "types.rkt")
(provide get-concrete
         parse/gen
         unfold)

(require racket/runtime-path)
(define-runtime-path HERE ".")
 
(define (c-libs)
  (list (build-path HERE 'up "c/.libs") HERE))
(define-ffi-definer define-pgf (ffi-lib #:get-lib-dirs c-libs "libpgf"))
(define-ffi-definer define-gu  (ffi-lib #:get-lib-dirs c-libs "libgu"))
(define-ffi-definer define-enum (ffi-lib #:get-lib-dirs c-libs "enums"))



(define-gu gu_new_pool (_fun -> _gu-pool*))
(define-gu gu_local_pool_ (_fun -> _gu-pool*))
(define-gu gu_new_exn (_fun _gu-pool* -> _gu_exn*))
(define-gu gu_variant_open (_fun _gu-variant -> _gu-variant-info))

(define-pgf pgf_read
  (_fun _path _gu-pool* _gu_exn* -> _pgf-pgf*))
(define-pgf language
  (_fun _pgf-pgf* _string -> _pgf-concr*)
  #:c-id pgf_get_language)
(define-pgf pgf_parse
  (_fun _pgf-concr* _string _string _gu_exn* _gu-pool* _gu-pool* -> _gu-enum*))
(define-pgf start-cat
  (_fun _pgf-pgf* -> _string)
  #:c-id pgf_start_cat)
(define-pgf concrete-name
  (_fun _pgf-concr* -> _string)
  #:c-id pgf_concrete_name)
(define-pgf pgf_expr_arity (_fun _pgf-expr -> _int))
(define-pgf pgf_expr_unapply (_fun _pgf-expr _gu-pool* -> _pgf-application-pointer))


(define-enum next_exp (_fun _gu-pool* _gu-enum* -> _pgf-exp-pb*))

(define (unapp pgf-expr)
  (let* ([pool (gu_new_pool)]
         [app (pgf_expr_unapply pgf-expr pool)]
         [fun (pgf-application-fun app)]
         [nargs (pgf-application-n_args app)]
         [args (pgf-application-args app)])
    (values
     (cons (string->symbol fun)
           (ptr-ref args (_array/list _size nargs)))
     pool)))


         
(struct pgf [pgf cnc pool])

(define (get-concrete pgf-path lang)
  (define pool (gu_new_pool))
  (define err1 (gu_new_exn pool))
  (define _pgf (pgf_read pgf-path pool err1))
  (define _cnc (language _pgf lang))
  (displayln (format "concrete: ~a, start: ~a" (concrete-name _cnc) (start-cat _pgf)))
  (pgf _pgf _cnc pool))




(require racket/generator)
(define (parse/gen pgf input cat)
  (define pool (pgf-pool pgf))
  (define err (gu_new_exn pool))
  (define parsings
    (pgf_parse (pgf-cnc pgf) (symbol->string cat) input err pool pool))
  (generator ()
             (let next ()
               (define ep (next_exp pool parsings))
               (when ep
                 (yield (cons
                         (pgf-exp-pb-prob ep)
                         (pgf-exp-pb-expr ep)))
                 (next)))))
  




(define (reformat bs)
  (apply bytes (for/list ([b bs]) #:break (zero? b) b)))
(define (reformat/utf-8 bs)
  (bytes->string/utf-8 (reformat bs)))
(define (reformat/symbol bs)
  (string->symbol (reformat/utf-8 bs)))

(define (unfold-literal lit)
  (let* ([ei (gu_variant_open lit)]
         [tag (gu-variant-info-tag_ ei)]
         [data (gu-variant-info-data ei)])
    (case tag
      [(0) ; PGF_LITERAL_STR
       (let ([lit (ptr-ref data _pgf-literal-str)])
         (reformat (pgf-literal-str-val lit)))]
      [(1) ; PGF_LITERAL_INT
       (let ([lit (ptr-ref data _pgf-literal-int)])
         (pgf-literal-int-val lit))]
      [else
       (error (format "Literal tag '~a' not implemented" tag))])))
         


(define (unfold exp)
  (let loop ([e exp] [args '()])
    (let* ([info (gu_variant_open e)]
           [tag (gu-variant-info-tag_ info)]
           [data (gu-variant-info-data info)])
      (case tag
        [(1)
         (let ([app (ptr-ref data _pgf-expr-app)])
           (loop
            (pgf-expr-app-fun app)
            (cons (pgf-expr-app-arg app) args)))]
        [(2) ; Literal
         (unfold-literal (ptr-ref data _pgf-expr-lit))]
        [(4)
         (let* ([fun (ptr-ref data _pgf-expr-fun)]
                [ffun (pgf-expr-fun-fun fun)]
                [sfun (reformat/symbol ffun)])
           (cons sfun (map unfold args)))]
        [else
         (error (format "Expr tag '~a' not implemented" tag))]))))

