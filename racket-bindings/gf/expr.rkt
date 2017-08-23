#lang racket
(require ffi/unsafe
         gf/pgf gf/bindings)

(provide unfold unpack)


(define-pgf pgf_expr_arity (_fun _pgf-expr -> _int))
(define-pgf pgf_expr_unapply (_fun _pgf-expr _gu-pool* -> _pgf-application-pointer/null))
(define-pgf pgf_complete (_fun _pgf-concr* _string _string _string _gu-exn* _gu-pool* -> _gu-enum*))


; Unfolding Expr

(define (unfold-literal lit)
  (let* ([ei (gu_variant_open lit)]
         [tag (get-variant-info-tag ei _literal-tag)]
         [data (gu-variant-info-data ei)])
    (case tag
      [(string) ; PGF_LITERAL_STR
       (let ([lit (ptr-ref data _pgf-literal-str-pointer)])
         (cast (ptr-add lit -1) _pgf-literal-str-pointer _string))]
      [(int)    ; PGF_LITERAL_INT
       (let ([lit (ptr-ref data _pgf-literal-int)])
         (pgf-literal-int-val lit))]
      [else
       (error (format "Literal tag '~a' not implemented" tag))])))


(define (unpack exp)
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
               (cons sfun (map unpack args))))]
        [else
         (error (format "Expr tag '~a' not implemented" tag))]))))




;; testing

(define (rearray/list array type n)
  (ptr-ref
   (array-ptr array)
   (_array/list type n)))

(define (unapply* exp pool)
  (let ([app (pgf_expr_unapply exp pool)])
    (when app
      (let ([nargs (pgf-application-n_args app)]
            [fun (string->symbol (pgf-application-fun app))]
            [args (pgf-application-fun app)])
        (if (zero? nargs)
            (list fun)
            (cons fun
                  (rearray/list (pgf-application-args app) _pgf-expr nargs)))))))

(define (unapply exp)
  (let ([pool (gu_new_pool)])
    (unapply* exp pool)))


(define (unfold exp)
  (local-require racket/match)
  (define pool (gu_new_pool))
  (let next ([e exp])
    (let* ([info (gu_variant_open e)]
           [tag (get-variant-info-tag info _expr-tag)]
           [data (gu-variant-info-data info)])
      (case tag
        [(app)
         (match (unapply* e pool)
           [(list f arg ...) (cons f (map next arg))]
           [(? symbol? f) f]
           [a
            (error (format "Unknown form in app '~a'" a))])]
        [(lit) ; Literal
         (unfold-literal (ptr-ref data _pgf-expr-lit))]
        [(fun)
         (let* ([fun (ptr-ref data _pgf-expr-fun)]
                [sfun (string->symbol
                       (cast data _pointer _string))])
           sfun)]
        [else
         (error (format "Expr tag '~a' not implemented" tag))]))))



