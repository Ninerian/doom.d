;;; ~/.doom.d/+colmak.el -*- lexical-binding: t; -*-

(use-package! evil-colemak-basics
  :after evil
  :config
  (setq evil-colemak-basics-rotate-t-f-j t)
  (setq evil-colemak-basics-char-jump-commands 'evil-snipe))

(after! evil (global-evil-colemak-basics-mode))
;; (after! evil (global-undo-tree-mode))

(use-package! evil-better-visual-line
  :after evil-colemak-basics
  :config
  (evil-better-visual-line-on)
  (map! :map evil-colemak-basics-keymap
        (:nvm "n" 'evil-better-visual-line-next-line
         :nvm "e" 'evil-better-visual-line-previous-line
         :nvm "g n" 'evil-next-line
         :nvm "g e" 'evil-previous-line))
)

(after! pdf-view
  (add-hook! 'pdf-view-mode-hook (evil-colemak-basics-mode -1))
 (map!
   :map pdf-view-mode-map
   :n "g g"          #'pdf-view-first-page
   :n "G"            #'pdf-view-last-page
   :n "N"            #'pdf-view-next-page-command
   :n "E"            #'pdf-view-previous-page-command
   :n "e"            #'evil-collection-pdf-view-previous-line-or-previous-page
   :n "n"            #'evil-collection-pdf-view-next-line-or-next-page
   )
 )

(after! evil
 (map! :map evil-window-map
        (:leader
         (:prefix ("w" . "Select Window")
          :n :desc "Left"  "h" 'evil-window-left
          :n :desc "Up"    "e" 'evil-window-up
          :n :desc "Down"  "n" 'evil-window-down
          :n :desc "Right" "i" 'evil-window-right
          ))
        ))

(after! evil (map! :map evil-motion-state-map
                   (:n :desc "Previous match" "K" 'evil-ex-search-previous
                    :n :desc "Next match" "k" 'evil-ex-search-next
                    :n :desc "Forward search" "/" 'evil-search-forward
                    )
                   ))

(after! evil
  (map! :map evil-colemak-basics-keymap
      :nv "I" nil
      :nv "N" 'evil-scroll-page-up
      :nv "E" 'evil-scroll-page-down
      :nv "l" 'undo
      :nv "L" 'redo)
  )

(after! evil
  (map! :nv "I" 'evil-window-bottom))

(after! org
  (remove-hook 'org-mode-hook 'evil-org-mode)
  (setq evil-org-movement-bindings
        '((up . "e") (down . "n")
          (left . "h") (right . "i"))
        )
)
