(straight-use-package 'magit)
(straight-use-package 'evil-magit)
(after-load 'magit (define-key magit-status-mode-map (kbd "SPC") nil))



(straight-use-package 'git-gutter-fringe)
(global-git-gutter-mode +1)

(provide 'init-git)
