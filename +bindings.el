;;; +bindings.el -*- lexical-binding: t; -*-

;; (map! :leader :n :desc "Slurp" "<" :sexp/slurp-forward)

;; (:bindings (">" "Slurp" :sexp/slurp-forward))

(after! evil
  (map!
        :nv "<" 'sp-backward-slurp-sexp
        :nv ">" 'sp-forward-slurp-sexp))
