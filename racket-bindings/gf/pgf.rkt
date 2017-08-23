#lang racket/base
(require ffi/unsafe
         "bindings.rkt")
(provide get-concrete
         parse/gen parse/list parse/sort parse/stream
         linearize)


; pgf functions
(define-pgf pgf_read
  (_fun _path _gu-pool* _gu-exn* -> _pgf-pgf*))
(define-pgf language
  (_fun _pgf-pgf* _string -> _pgf-concr*)
  #:c-id pgf_get_language)
(define-pgf pgf_parse
  (_fun _pgf-concr* _string _string _gu-exn* _gu-pool* _gu-pool* -> _gu-enum*))
(define-pgf start-cat
  (_fun _pgf-pgf* -> _string)
  #:c-id pgf_start_cat)
(define-pgf concrete-name
  (_fun _pgf-concr* -> _string)
  #:c-id pgf_concrete_name)


(define-pgf pgf_linearize (_fun _pgf-concr* _pgf-expr _gu-out* _gu-exn* -> _void))



; Concrete struct

(struct pgf [pgf cnc pool])

(define (get-concrete pgf-path lang)
  (let* ([pgf-path* (path->complete-path pgf-path)]
         [pool (gu_new_pool)]
         [err1 (gu_new_exn pool)]
         [_pgf (if (file-exists? pgf-path*)
                   (pgf_read pgf-path* pool err1)
                   (error (format "file ~a not found" pgf-path*)))]
         [_cnc (language _pgf lang)])
    (displayln (format "concrete: ~a, start: ~a" (concrete-name _cnc) (start-cat _pgf)))
    (pgf _pgf _cnc pool)))



; Parsing

(define (get-cat pgf cat)
  (if cat
      cat
      (string->symbol
       (start-cat (pgf-pgf pgf)))))

(define (parse pgf input cat)
  (let* ([pool (pgf-pool pgf)]
         [err (gu_new_exn pool)]
         [parsings
          (pgf_parse (pgf-cnc pgf) (symbol->string cat) input err pool pool)])
    (unless (gu_exn_is_raised err)
      (values parsings pool))))

(define (next-pb-exp pool enum)
  (enum-next _pgf-exp-pb* enum pool))


(define (parse/list pgf input [cat #f])
  (let-values ([(parsings pool)
                (parse pgf input (get-cat pgf cat))])
    (if parsings
        (let loop ([ps '()])
          (let* ([ep (next-pb-exp pool parsings)])
            (if ep
                (loop (cons
                       (cons (pgf-exp-pb-prob ep)
                             (pgf-exp-pb-expr ep))
                       ps))
                ps)))
        '())))

(define (parse/sort pgf input [cat #f] #:key [key car])
  (map cdr
       (sort (parse/list pgf input cat) < #:key key)))


(define (parse/gen pgf input [cat #f])
  (local-require racket/generator)
  (define-values
    (parsings pool)
    (parse pgf input (get-cat pgf cat)))
  (when parsings
    (generator ()
               (let next ()
                 (define ep (next-pb-exp pool parsings))
                 (when ep
                   (yield (cons
                           (pgf-exp-pb-prob ep)
                           (pgf-exp-pb-expr ep)))
                   (next))))))

(define (parse/stream pgf input [cat #f])
  (local-require racket/stream)
   (define-values
    (parsings pool)
    (parse pgf input (get-cat pgf cat)))
  (if parsings
      (let next ()
        (define ep (next-pb-exp pool parsings))
        (if ep
            (stream-cons (cons
                          (pgf-exp-pb-prob ep)
                          (pgf-exp-pb-expr ep))
                         (next))
            empty-stream))
      empty-stream))
    
      


; Linearizing

(define (linearize pgf expr)
  (define pool (pgf-pool pgf))
  (define err (gu_new_exn pool))
  (define sbuf (gu_string_buf pool))
  (define out (gu_string_buf_out sbuf))
  (define cnc (pgf-cnc pgf))
  (pgf_linearize cnc expr out err)
  (unless (gu_exn_is_raised err)
    (gu_string_buf_freeze sbuf pool)))


