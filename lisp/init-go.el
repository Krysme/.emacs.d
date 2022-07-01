(straight-use-package 'go-mode)
(add-hook 'go-mode-hook 'lsp-deferred)


(defun compile-go-lsp () 
  (interactive) 
  (compile (concat  "go build " (lsp-workspace-root))))

(defun run-go-lsp () 
  (interactive) 
  (compile (concat  "go run " (lsp-workspace-root))))

(add-hook 'go-mode-hook 'smartparens-mode)
(add-hook 'go-mode-hook 'show-paren-mode)

(add-hook 'go-mode-hook 
	  (lambda () 
	    (define-key go-mode-map (kbd "C-c C-b") 'compile-go-lsp) 
	    (define-key go-mode-map (kbd "C-c C-r") 'run-go-lsp) 
	    (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round) 
	    (define-key evil-visual-state-map (kbd ")") 'sp-wrap-square) 
	    (define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly) 
	    (define-key evil-visual-state-map (kbd "<") 
	      (lambda () 
		(interactive) 
		(sp-wrap-with-pair "<")))))

(provide 'init-go)
