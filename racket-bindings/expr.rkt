#lang racket
(require ffi/unsafe
         "types.rkt"
         "gf.rkt")

(define _expr-tags (_enum '(abs app lit meta fun var typed impl-args num-tags)))
(define-cstruct _expr-info
  ([tag_ _expr-tags]
   [data _pointer]))
(define (expr-tag e)
  (expr-info-tag_
   (cast (gu_variant_open e)
         _gu-variant-info
         _expr-info)))