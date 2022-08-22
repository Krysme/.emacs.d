

(straight-use-package 'ccls)
(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)

(setq init-c-cpp-modes '(c-mode c++-mode cc-mode))

(after-load 'smartparens (dolist (m init-c-cpp-modes)
(sp-local-pair m "'" "'")))

(setq c-default-style "linux" c-basic-offset 4)

(add-hook 'c-mode-hook '配平括号)
(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'c++-mode-hook '配平括号)
(add-hook 'c++-mode-hook 'smartparens-mode)

(defun 配平括号 () "如题" (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round)
(define-key evil-visual-state-map (kbd ")") 'sp-wrap-square)
(define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly))

(after-load 'yasnippet-snippets (add-hook 'c++-mode-hook 'yas-minor-mode-on)
(add-hook 'c-mode-hook 'yas-minor-mode-on))


(provide 'init-c-cpp)
