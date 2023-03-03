

(straight-use-package 'typescript-mode)

(add-hook 'typescript-mode-hook 'smartparens-mode)
(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook 'show-paren-mode)

(add-hook 'typescript-mode-hook
	  (lambda () 
	    (evil-define-key 'visual toml-mode-map (kbd "(") 'sp-wrap-round)
	    (evil-define-key 'visual toml-mode-map (kbd "[") 'sp-wrap-square)
	    (evil-define-key 'visual toml-mode-map (kbd "{") 'sp-wrap-curly)
	    (evil-define-key 'visual toml-mode-map (kbd "\"") (lambda () (interactive) (sp-wrap-with-pair "\"")))))

(provide 'init-typescript)
