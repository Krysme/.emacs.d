


(defface lsp-ui-sideline-code-action
  '((t :foreground "red"))
  "Face used to highlight code action text."
  :group 'lsp-ui-sideline)

(ensure-package 'lsp-mode)
(ensure-package 'company-lsp)
(ensure-package 'lsp-ui)
(ensure-package 'yasnippet)
(ensure-package 'ccls)

(ensure-package 'smartparens)

(after-load 'lsp-mode
  (setq lsp-enable-snippet t))

(ensure-package 'flycheck)

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t
			  c-default-style "bsd")


(after-load 'lsp-mode
  (setq lsp-prefer-flymake nil))

(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t)))
  (add-hook 'lsp-mode-hook 'yas-minor-mode))


(after-load 'evil
  (after-load 'lsp-ui
	(add-hook 'lsp-ui-doc-mode-hook
      	      (lambda () (interactive)
				(advice-add 'evil-force-normal-state :around (lambda (orig-fun &rest args)
															   (lsp-ui-doc-hide)))))))

(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'company-mode))




