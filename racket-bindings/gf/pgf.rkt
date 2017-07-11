#lang racket/base
(require ffi/unsafe
         "bindings.rkt")
(provide get-concrete
         parse/gen parse/list parse/sort
         unfold)


; pgf functions
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



; Concrete struct

(struct pgf [pgf cnc pool])

(define (get-concrete pgf-path lang)
  (let* ([pgf-path* (path->complete-path pgf-path)]
        [pool (gu_new_pool)]
        [err1 (gu_new_exn pool)]
        [_pgf (pgf_read pgf-path* pool err1)]
        [_cnc (language _pgf lang)])
    (displayln (format "concrete: ~a, start: ~a" (concrete-name _cnc) (start-cat _pgf)))
    (pgf _pgf _cnc pool)))



; Parsing

(define (parse pgf input cat)
  (define pool (pgf-pool pgf))
  (define err (gu_new_exn pool))
  (values
    (pgf_parse (pgf-cnc pgf) (symbol->string cat) input err pool pool)
    pool))

(define (next-pb-exp pool enum)
  (enum-next _pgf-exp-pb* enum pool))


(define (parse/list pgf input cat)
  (define-values
    (parsings pool)
    (parse pgf input cat))
  (let loop ([ps '()])
    (let* ([ep (next-pb-exp pool parsings)])
      (if ep
          (loop (cons
                 (cons (pgf-exp-pb-prob ep)
                       (pgf-exp-pb-expr ep))
                 ps))
          ps))))

(define (parse/sort pgf input cat)
  (map cdr
       (sort (parse/list pgf input cat) < #:key car)))


(define (parse/gen pgf input cat)
  (local-require racket/generator)
  (define-values
    (parsings pool)
    (parse pgf input cat))
  (generator ()
             (let next ()
               (define ep (next-pb-exp pool parsings))
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
         [tag (get-variant-info-tag ei _literal-tag)]
         [data (gu-variant-info-data ei)])
    (case tag
      [(string) ; PGF_LITERAL_STR
       (let ([lit (ptr-ref data _pgf-literal-str-pointer)])
         (cast (ptr-add lit -1) _pgf-literal-str-pointer _string))]
      [(int) ; PGF_LITERAL_INT
       (let ([lit (ptr-ref data _pgf-literal-int)])
         (pgf-literal-int-val lit))]
      [else
       (error (format "Literal tag '~a' not implemented" tag))])))


(define (unfold exp)
  (let loop ([e exp] [args '()])
    (let* ([info (gu_variant_open e)]
           [tag (get-variant-info-tag info _expr-tag)]
           [data (gu-variant-info-data info)])
      (case tag
        [(app)
         (let ([app (ptr-ref data _pgf-expr-app)])
           (loop
            (pgf-expr-app-fun app)
            (cons (pgf-expr-app-arg app) args)))]
        [(lit) ; Literal
         (unfold-literal (ptr-ref data _pgf-expr-lit))]
        [(fun)
         (let* ([fun (ptr-ref data _pgf-expr-fun)]
                [sfun (string->symbol
                       (cast data _pointer _string))])
           (if (null? args)
               sfun
               (cons sfun (map unfold args))))]
        [else
         (error (format "Expr tag '~a' not implemented" tag))]))))
