#lang racket/base
(require ffi/unsafe
         ffi/unsafe/define
         "types.rkt")

(provide get-concrete
         parse/gen
         unfold)


(define c-libs
  (λ () (let ([cd (current-directory)])
          (list (build-path cd "../c/.libs") cd))))
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

;(define-pgf pgf_print_expr (_fun _pgf-expr PgfExpr expr, PgfPrintContext* ctxt, int prec, 
;               GuOut* out, GuExn* err);

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


(define (unn e)
  (let* ([pool (gu_new_pool)]
         [app1 (pgf_expr_unapply e pool)]
         [fun1 (pgf-application-fun app1)]
         [n1 (pgf-application-n_args app1)]
         [args1 (ptr-ref (pgf-application-args app1) (_array/list _pgf-expr n1))]
         [app2 (pgf_expr_unapply (car args1) pool)])
    (pgf-application-n_args app2)))
         
         


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

(define (reformat bs)
  (bytes->string/utf-8 (apply bytes (for/list ([b bs]) #:break (zero? b) b))))


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
        [(4)
         (let* ([fun (ptr-ref data _pgf-expr-fun)]
                [ffun (pgf-expr-fun-fun fun)]
                [sfun (string->symbol (reformat ffun))])
           (cons sfun (map unfold args)))]
        [else
         (error (format "Expr tag '~a' not implemented" tag))]))))

