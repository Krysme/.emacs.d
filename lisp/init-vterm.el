

(straight-use-package 'vterm)

(add-hook 'vterm-mode-hook (lambda () (evil-emacs-state)))

(provide 'init-vterm)
