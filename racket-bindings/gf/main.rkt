#lang racket/base

(module+ test
  (require rackunit)
  (require gf/pgf gf/expr))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included a LICENSE.txt file, which links to
;; the GNU Lesser General Public License.
;; If you would prefer to use a different license, replace LICENSE.txt with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here

(module+ test
  (require racket/list)
  ;; Tests to be run with raco test
  (define foods (get-concrete "../Foods.pgf" "FoodsEng"))
  (define sentence "that cheese is very warm")
  (define ps
    (parse/list foods sentence))

  (check-equal?
   (length ps) 1)
  (define p (cdr (first ps)))

  (check-equal?
   (car (unfold p)) 'Pred)

  (check-equal?
   (unfold p) (unpack p))

  (check-equal?
   (linearize foods p) sentence))

 (module+ main
   ;; Main entry point, executed when run with the `racket` executable or DrRacket.
   )
