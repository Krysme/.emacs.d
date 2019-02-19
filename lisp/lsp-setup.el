
(ensure-package 'rust-mode)
(ensure-package 'flycheck)

(ensure-package 'lsp-mode)
(ensure-package 'company-lsp)
(ensure-package 'lsp-ui)

(after-load 'lsp-mode
  (after-load 'rust-mode
    (add-hook 'rust-mode-hook 'lsp)))

(after-load 'lsp-mode
  (setq lsp-prefer-flymake nil)
  (add-hook
   'lsp-mode-hook
   (lambda ()
     (flycheck-mode t))))

(after-load 'rust-mode
  (add-hook 'rust-mode-hook 'smartparens-mode))



(ensure-package 'smartparens)

(after-load 'smartparens
  (add-hook
   'smartparens-mode-hook
   (lambda ()
     (define-key sp-pair-overlay-keymap (kbd "C-g") nil))))





(provide 'lsp-setup)
