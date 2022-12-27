;;; +svelte.el -*- lexical-binding: t; -*-

;; svelte support
(add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
(setq web-mode-engines-alist
      '(("svelte" . "\\.svelte\\'")))
