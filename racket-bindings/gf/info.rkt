#lang info
(define cruntime-lib-dir "relative path to c/.libs/")
               
(define collection "gf")
(define deps '("base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/gf.scrbl" ())))
(define pkg-desc "Racket bindings to Grammatical Framework")
(define version "0.1")
(define pkg-authors '(saludes))
(define copy-foreign-libs
  (list (build-path cruntime-lib-dir "libpgf.dylib")
        (build-path cruntime-lib-dir "libgu.dylib")))
  