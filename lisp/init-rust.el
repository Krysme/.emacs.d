
(straight-use-package 'rust-mode)
(straight-use-package 'cargo)

(setq lsp-rust-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-display-inlay-hints nil)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-rust-analyzer-cargo-load-out-dirs-from-check t)
(setq lsp-rust-features [])
(setq lsp-rust-analyzer-proc-macro-enable t)

(setq lsp-response-timeout 100)

(add-hook 'rust-mode-hook 'lsp)

(add-hook 'rust-mode-hook 'smartparens-mode)
(add-hook 'rust-mode-hook 'show-paren-mode)
(add-hook 'rust-mode-hook (lambda ()
			    (setq tab-width 4)))

(after-load 'smartparens
  (sp-local-pair 'rust-mode "'" nil :actions nil))



(after-load 'cargo
  (setq cargo-process--command-run "run --release")
  (setq cargo-process--command-clippy "clippy"))

(after-load 'rust-mode
  (rust-enable-format-on-save))

(provide 'init-rust)
