;; -*- lexical-binding: t -*-

(straight-use-package 'vterm)

(add-hook 'vterm-mode-hook (lambda () (evil-emacs-state)))


(global-set-key (kbd "C-4") 'vterm-other-window)

(provide 'init-vterm)
