
(ensure-package 'lsp-mode)
(ensure-package 'company-lsp)
(ensure-package 'lsp-ui)
(ensure-package 'yasnippet)
(ensure-package 'ccls)

(after-load 'lsp-mode
  (setq lsp-enable-snippet nil))

(ensure-package 'rust-mode)
(ensure-package 'flycheck)
(Ensure-package 'flycheck-rust)
(ensure-package 'cargo)


(after-load 'lsp-mode
  (after-load 'rust-mode
    (add-hook 'rust-mode-hook 'lsp)))

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t
			  c-default-style "bsd")

(after-load 'lsp-mode
  (add-hook 'c++-mode-hook 'lsp))


(after-load 'lsp-mode
  (add-hook 'c-mode-hook 'lsp))

(add-hook 'c++-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)

(after-load 'lsp-mode
  (setq lsp-prefer-flymake nil)
  )


(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t)))
  (add-hook 'lsp-mode-hook 'yas-minor-mode))

(after-load 'rust-mode
  (add-hook 'rust-mode-hook 'smartparens-mode))

(after-load 'rust-mode
  (rust-enable-format-on-save))

(add-hook 'conf-toml-mode-hook 'smartparens-mode)


(after-load 'evil
  (after-load 'lsp-ui
	(add-hook 'lsp-ui-doc-mode-hook
      	      (lambda () (interactive)
				(advice-add 'evil-force-normal-state :around (lambda (orig-fun &rest args)
															   (lsp-ui-doc-hide)))))))


(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'linum-mode))


(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'company-mode))

(ensure-package 'smartparens)

(after-load 'smartparens
  (add-hook
   'smartparens-mode-hook
   (lambda ()
     (define-key sp-pair-overlay-keymap (kbd "C-g") nil))))



(after-load 'yasnippet
  (define-key yas-minor-mode-map [tab] nil)
  (define-key yas-keymap [tab] nil))



(provide 'lsp-setup)
