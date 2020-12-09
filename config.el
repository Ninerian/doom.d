;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Daniel Große"
      user-mail-address "hallo@daniel-der-grosse.de")
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

(after! magit
  (magit-delta-mode +1))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))
(setq doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font"))

(unless (find-font doom-font)
  (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 14))
  (setq doom-unicode-font (font-spec :family "FiraCode Nerd Font")))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)
(delq! t custom-theme-load-path)

(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

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

(after! helm
  ;; I want backspace to go up a level, like ivy
  (add-hook! 'helm-find-files-after-init-hook
    (map! :map helm-find-files-map
          "<DEL>" #'helm-find-files-up-one-level)))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)

(add-hook 'evil-normal-state-entry-hook #'company-abort))

(set-company-backend! '(text-mode
                        markdown-mode
                        gfm-mode)
  '(:seperate company-ispell
              company-files
              company-yasnippet))

(set-company-backend! 'ess-r-mode '(company-R-args company-R-objects company-dabbrev-code :separate))

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-leader-key "SPC"
      doom-localleader-key ",")


(setq auth-sources '("~/.authinfo"))

;; Aspell
(setq ispell-aspell-data-dir "/usr/local/Cellar/aspell/0.60.8/lib/aspell-0.60")
(setq ispell-aspell-dict-dir ispell-aspell-data-dir)
(setq ispell-aspell-dictionary-alist '())
(add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "en") (ispell-aspell-find-dictionary "de"))

(setq lsp-eslint-server-command
   '("node"
     "/home/danielgrosse/.vscode/extensions/dbaeumer.vscode-eslint-2.1.8/server/out/eslintServer.js"
     "--stdio"))

(map! :v "s" #'evil-surround-region)
(map! :v "S" #'evil-substitute)

(load! "+colmak.el")
(load! "+splash.el")
(load! "+keycast.el")
(load! "+clojure.el")
