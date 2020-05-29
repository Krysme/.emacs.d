
(ensure-package 'rust-mode)
(ensure-package 'flycheck-rust)
(ensure-package 'cargo)


(setq lsp-rust-server 'rust-analyzer)

(after-load 'lsp-mode
  (after-load 'rust-mode
    (add-hook 'rust-mode-hook 'lsp)))

(after-load 'rust-mode
  (add-hook 'rust-mode-hook 'smartparens-mode)
  (add-hook 'rust-mode-hook 'show-paren-mode)
  (add-hook 'rust-mode-hook (lambda ()
							  (setq tab-width 4))))

(after-load 'rust-mode
  (rust-enable-format-on-save))

(after-load 'rust-mode
  (after-load 'smartparens
	(sp-local-pair 'rust-mode "'" nil :actions nil)))

(add-hook 'conf-toml-mode-hook 'smartparens-mode)
