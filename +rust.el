;;; +rust.el -*- lexical-binding: t; -*-

(after! rustic
  (set-formatter! 'rustic-mode #'rustic-cargo-fmt))

(setq rustic-lsp-server 'rust-analyzer
      rustic-format-on-save t
      lsp-rust-server 'rust-analyzer)

(set-popup-rule!
  "^\\*rust"
  :slot -2
  :size 0.45
  :side 'right
  :autosave t
  :quit 'current
  :ttl nil
  :modeline t)

(custom-set-faces!
  `(lsp-rust-analyzer-inlay-face :inherit lsp-details-face))

(setq dap-cpptools-extension-version "1.5.1")

(after! lsp-rust
  (setq lsp-rust-analyzer-lru-capacity 10
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints nil
        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-run-build-scripts t
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy")
  (require 'dap-cpptools))

(after! dap-cpptools
  (dap-register-debug-template "Rust::CppTools Run Configuration"
                               (list :type "cppdbg"
                                     :request "launch"
                                     :name "Rust::Run"
                                     :MIMode "gdb"
                                     :miDebuggerPath "rust-gdb"
                                     :environment []
                                     :program "${workspaceFolder}/target/debug/hello / replace with binary"
                                     :cwd "${workspaceFolder}"
                                     :console "external"
                                     :dap-compilation "cargo build"
                                     :dap-compilation-dir "${workspaceFolder}")))

(after! dap-mode
  (setq dap-default-terminal-kind "integrated")
  (dap-auto-configure-mode +1))

(map!
 (:after rustic
  (:map rustic-mode-map
   :localleader
   (:prefix ("r" . "Rustic")
    :desc "Clippy pretty"     "C" #'rustic-cargo-clippy
    :desc "Popup"             "r" #'rustic-popup
    :desc "Format everything" "f" #'rustic-cargo-fmt
    :desc "Cargo-outdated"    "u" #'rustic-cargo-outdated))))
