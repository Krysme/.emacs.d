(straight-use-package 'typescript-mode)
(straight-use-package 'tide)

(defun tide-evil-key-setup ()
    (define-key evil-normal-state-map (kbd "g r") 'xref-find-references)
    (define-key evil-normal-state-map (kbd "SPC o") 'tide-rename-symbol))

(defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1)

    (define-key tide-mode-map (kbd "C-c C-f") 'tide-format)
    (tide-evil-key-setup))

(setq company-tooltip-align-annotations t)

(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

(add-hook 'typescript-mode-hook 'smartparens-mode)
(add-hook 'typescript-mode-hook 'show-paren-mode)



(add-hook 'typescript-mode-hook (lambda ()
				    (evil-define-key 'visual toml-mode-map (kbd "(") 'sp-wrap-round)
				    (evil-define-key 'visual toml-mode-map (kbd "[") 'sp-wrap-square)
				    (evil-define-key 'visual toml-mode-map (kbd "{") 'sp-wrap-curly)
				    (evil-define-key 'visual toml-mode-map (kbd "\"") (lambda () (interactive) (sp-wrap-with-pair "\"")))))

(provide 'init-typescript)
