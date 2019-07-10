(defface lsp-ui-sideline-code-action
  '((t :foreground "red"))
  "Face used to highlight code action text."
  :group 'lsp-ui-sideline)

(ensure-package 'lsp-mode)
(ensure-package 'company-lsp)
(ensure-package 'lsp-ui)
(ensure-package 'yasnippet)

(ensure-package 'smartparens)

(after-load 'lsp-mode
  (setq lsp-enable-snippet t))

(ensure-package 'flycheck)


(after-load 'lsp-mode
  (setq lsp-prefer-flymake nil))

(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t)))
  (add-hook 'lsp-mode-hook 'yas-minor-mode))


(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'company-mode))



