;;; +clojure.el -*- lexical-binding: t; -*-

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook! cider-repl-mode #'evil-normalize-keymaps)

;; (with-eval-after-load 'company
;;   (add-hook 'evil-local-mode-hook
;;             (lambda ()
;;               ;; Note:
;;               ;; Check if `company-emulation-alist' is in
;;               ;; `emulation-mode-map-alists', if true, call
;;               ;; `company-ensure-emulation-alist' to ensure
;;               ;; `company-emulation-alist' is the first item of
;;               ;; `emulation-mode-map-alists', thus has a higher
;;               ;; priority than keymaps of evil-mode.
;;               ;; We raise the priority of company-mode keymaps
;;               ;; unconditionally even when completion is not
;;               ;; activated. This should not cause problems,
;;               ;; because when completion is activated, the value of
;;               ;; `company-emulation-alist' is ((t . company-my-keymap)),
;;               ;; when completion is not activated, the value is ((t . nil)).
;;               (when (memq 'company-emulation-alist emulation-mode-map-alists)
;;                 (company-ensure-emulation-alist)))))

;; (after! clojure-mode
;;   (map!
;;    :nv "<" 'sp-backward-slurp-sexp
;;    :nv ">" 'sp-forward-slurp-sexp))
(use-package! neil
  :config
  (setq neil-prompt-for-version-p nil
        neil-inject-dep-to-project-p t))
