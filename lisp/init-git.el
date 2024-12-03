(use-package magit :ensure t)
(after-load 'magit (define-key magit-status-mode-map (kbd "SPC") nil))



(use-package git-gutter-fringe :ensure t)
(global-git-gutter-mode +1)

(provide 'init-git)
