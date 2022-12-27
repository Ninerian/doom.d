;;; +company.el -*- lexical-binding: t; -*-


;; (after! company
;;   (setq company-idle-delay 0.5
;;         company-minimum-prefix-length 2)
;;   (setq company-show-numbers t)

;;   ;; (add-hook 'evil-normal-state-entry-hook #'company-abort)

;;   )

(set-company-backend! '(text-mode
                        markdown-mode
                        gfm-mode)
  '(:seperate company-ispell
              company-files
              company-yasnippet))

(set-company-backend! 'ess-r-mode '(company-R-args company-R-objects  :separate))

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)
