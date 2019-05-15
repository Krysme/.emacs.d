
(ensure-package 'rust-mode)
(ensure-package 'flycheck-rust)
(ensure-package 'cargo)


(after-load 'lsp-mode
  (after-load 'rust-mode
    (add-hook 'rust-mode-hook 'lsp)))

(after-load 'rust-mode
  (add-hook 'rust-mode-hook 'smartparens-mode))

(after-load 'rust-mode
  (rust-enable-format-on-save))
