#lang racket
(require gf/pgf gf/expr)

(define foods
  (get-concrete "Foods.pgf" "FoodsEng"))

(define ps
  (parse/list foods "this Italian cheese is very boring"))

(unpack (cdr (first ps)))

