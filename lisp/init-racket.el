(provide 'init-racket)

(straight-use-package 'racket-mode)

(add-hook 'racket-mode 'racket-xp-mode)
(add-hook 'racket-mode-hook (lambda () (define-key racket-mode-map (kbd "C-c C-r") 'racket-run)))

(add-hook 'racket-mode-hook 'paredit-mode)

(add-hook 'racket-mode-hook 'company-mode)
