;;; +yasnippet.el -*- lexical-binding: t; -*-

;;
;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

; hlissner
(use-package! doom-snippets
  :after yasnippet)
; AndreaCrotti
(use-package! yasnippet-snippets
  :after yasnippet)

(map!
 (:after yasnippet
  (:map yas-keymap
   [tab] #'yas-next-field
   "TAB" #'yas-next-field)))
