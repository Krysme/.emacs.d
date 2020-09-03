

(ensure-package 'ccls)


(after-load 'lsp-mode
  (add-hook 'c-mode-hook 'lsp))

(after-load 'lsp-mode
  (add-hook 'c++-mode-hook 'lsp))

(after-load 'yasnippet-snippets
	(add-hook 'c++-mode-hook 'yas-minor-mode-on))

(add-hook 'c++-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t
			  c-default-style "bsd")
