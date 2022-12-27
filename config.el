;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Daniel Große"
      user-mail-address "hallo@daniel-der-grosse.de")

(after! magit
  (magit-delta-mode +1))

(setq wakatime-api-key "1bcdcc8d-0741-44ba-8ce3-79bb7baced7a")
(setq wakatime-cli-path "/usr/local/bin/wakatime-cli")

(global-wakatime-mode)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-leader-key "SPC"
      doom-localleader-key ",")


(setq auth-sources '("~/.authinfo"))

(setq lsp-eslint-server-command
   '("node"
     "/home/danielgrosse/.vscode/extensions/dbaeumer.vscode-eslint-2.1.14/server/out/eslintServer.js"
     "--stdio"))

(setq lsp-zig-zls-executable "~/zls/zls")

(use-package lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (setq lsp-tailwindcss-major-modes '(svelte-mode html-mode sgml-mode mhtml-mode web-mode css-mode)))

(map! :v "s" #'evil-surround-region)
(map! :v "S" #'evil-subtitute)

(load! "+bindings.el")
(load! "+theme.el")
(load! "+lsp.el")
(load! "+ivy.el")
(load! "+company.el")
(load! "+colmak.el")
(load! "+projectile.el")
;; (load! "+splash.el")
(load! "+keycast.el")

(load! "+svelte.el")
(load! "+clojure.el")
(load! "+dart.el")
(load! "+rust.el")
(load! "+yasnippet.el")
