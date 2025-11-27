(straight-use-package 'lsp-haskell)
(straight-use-package 'haskell-mode)


(add-hook 'haskell-mode-hook 'lsp)

(add-hook 'haskell-mode-hook 'smartparens-mode)

(add-hook 'haskell-mode-hook 'smartparens-mode)
(add-hook 'haskell-mode-hook 'show-paren-mode)

(after-load 'smartparens (sp-local-pair 'haskell-mode "'" nil :actions nil) 
	    ;;(sp-local-pair 'rust-mode "<" ">") 
	    (sp-local-pair 'haskell-mode "\"" "\"") 
	    (sp-local-pair 'haskell-mode "\"" "\""))


;; (evil-define-key 'insert emacs-lisp-mode-map (kbd "C-w") 'backward-kill-sexp)
(add-hook 'haskell-mode-hook 
	  (lambda () 
	          (evil-define-key 'visual haskell-mode-map (kbd "(") 'sp-wrap-round)
	          (evil-define-key 'visual haskell-mode-map (kbd "[") 'sp-wrap-square)
	          (evil-define-key 'visual haskell-mode-map (kbd "{") 'sp-wrap-curly)
	          ;; (evil-define-key 'visual rust-mode-map (kbd "<") (lambda () (interactive) (sp-wrap-with-pair "<")))
                  ))

(provide 'init-haskell)
