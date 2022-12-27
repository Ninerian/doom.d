(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "9ef81da35ce99a4c7155db7d46e4f8c20a51860d6879cf082e3ed1c5222c17d3" "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" default))
 '(pos-tip-background-color "#191F26")
 '(pos-tip-foreground-color "#d4d4d6")
 '(safe-local-variable-values
   '((add-to-list 'lsp-file-watch-ignored-directories "[/\\]\13endor")
     (cider-clojure-cli-global-options . "-A:dev")
     (cider-ns-refresh-after-fn . "integrant.repl/go")
     (cider-ns-refresh-before-fn . "integrant.repl/halt")
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend")
     (cider-refresh-after-fn . "user/go")
     (cider-refresh-before-fn . "user/halt")
     (lsp-kotlin-compiler-jvm-target . "14")))
 '(warning-suppress-types
   '((lsp-mode)
     (lsp-mode)
     (before-save-hook)
     (before-save-hook)
     (before-save-hook)
     (before-save-hook)
     (nrepl-connected-hook)
     (nrepl-connected-hook)
     (nrepl-connected-hook))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-modified ((t (:foreground "orange"))))
 '(lsp-rust-analyzer-inlay-face ((t (:inherit lsp-details-face)))))
