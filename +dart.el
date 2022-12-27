;;; +dart.el -*- lexical-binding: t; -*-

(map! :after dart-mode
      :map dart-mode-map
      :localleader
      "l" #'lsp
      "O" #'lsp-dart-show-flutter-outline
      "Q" #'flutter-quit
      "r" #'flutter-hot-reload
      "R" #'flutter-run
      (:prefix ("c" . "create")
       "b" #'create-dart-bloc
       "c" #'create-dart-cubit)
      (:prefix ("d" . "debug")
       "d" #'dap-debug
       "r" #'lsp-dart-dap-flutter-hot-reload
       "R" #'lsp-dart-dap-flutter-hot-restart
       )
      (:prefix ("o" . "open")
       "d" #'lsp-dart-open-devtools
       )
      (:prefix ("p" . "pub")
       "g" #'lsp-dart-pub-get
       "o" #'lsp-dart-pub-outdated
       "u" #'lsp-dart-pub-upgrade
       )
      (:prefix ("t" . "test"))
      )

(use-package! dart-mode
  :config
  ;; (set-face-foreground 'fill-column-indicator "violet")
  (require 'whitespace)
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail)))

(use-package! hover
  :config
  (setq hover-hot-reload-on-save t
        hover-clear-buffer-on-hot-restart t
        hover-screenshot-path "$HOME/Pictures"))

(use-package! lsp-dart
  :after dart-mode
  :config
  (setq lsp-dart-dap-flutter-hot-reload-on-save t))

;; enable lsp on load
(add-hook 'dart-mode-hook 'whitespace-mode)
(add-hook 'dart-mode-hook 'lsp)
(add-hook 'dart-mode-hook #'display-fill-column-indicator-mode)

(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

(after! projectile
  (projectile-register-project-type 'flutter '("pubspec.yaml")
                                    :project-file "pubspec.yaml"
                                    :run "flutter run"
                                    :src-dir "lib/"
                                    :test "flutter test"
                                    :test-dir "test/"
                                    :test-suffix "_test"))
