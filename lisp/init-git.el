(straight-use-package 'magit)
(straight-use-package 'evil-magit)
(after-load 'magit (define-key magit-status-mode-map (kbd "SPC") nil))

(provide 'init-git)
