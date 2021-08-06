

(straight-use-package 'ccls)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq init-c-cpp-modes '(c-mode c++-mode cc-mode))

(after-load 'smartparens
  (dolist (m init-c-cpp-modes)
    (sp-local-pair m "'" "'")
    (sp-local-pair m "<" ">")))

(add-hook 'c-mode-hook '配平括号)
(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'c++-mode-hook '配平括号)
(add-hook 'c++-mode-hook 'smartparens-mode)

(defun 配平括号 ()
  "如题"
  (define-key evil-visual-state-map (kbd "(") 'sp-wrap-round)
  (define-key evil-visual-state-map (kbd ")") 'sp-wrap-square)
  (define-key evil-visual-state-map (kbd "{") 'sp-wrap-curly)
  (define-key evil-visual-state-map (kbd "<") (lambda () (interactive) (sp-wrap-with-pair "<"))))

(after-load 'yasnippet-snippets
  (add-hook 'c++-mode-hook 'yas-minor-mode-on)
  (add-hook 'c-mode-hook 'yas-minor-mode-on))


(provide 'init-c-cpp)
