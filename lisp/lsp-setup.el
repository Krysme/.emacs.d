
(ensure-package 'rust-mode)
(ensure-package 'flycheck)

(ensure-package 'lsp-mode)
(ensure-package 'company-lsp)
(ensure-package 'company)
(ensure-package 'lsp-ui)
(ensure-package 'yasnippet)
(ensure-package 'ccls)


(after-load 'lsp-mode
  (after-load 'rust-mode
    (add-hook 'rust-mode-hook 'lsp)))

(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t
	      c-default-style "bsd")

(after-load 'lsp-mode
  (add-hook 'c++-mode-hook 'lsp))

(after-load 'lsp-mode
  (add-hook 'c-mode-hook 'lsp))

(add-hook 'c++-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)

(after-load 'lsp-mode
  (setq lsp-prefer-flymake nil))


(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook (lambda () (flycheck-mode t)))
  (add-hook 'lsp-mode-hook 'yas-minor-mode))

(after-load 'rust-mode
  (add-hook 'rust-mode-hook 'smartparens-mode))

(after-load 'rust-mode
  (rust-enable-format-on-save))

(add-hook 'conf-toml-mode-hook 'smartparens-mode)



(after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'linum-mode))

(ensure-package 'smartparens)

(after-load 'smartparens
  (add-hook
   'smartparens-mode-hook
   (lambda ()
     (define-key sp-pair-overlay-keymap (kbd "C-g") nil))))


(after-load 'company
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; (after-load 'yasnippet
;;   (define-key yas-minor-mode-map [tab] (lambda () (interactive) (if 'company-active-map ))))


(provide 'lsp-setup)
