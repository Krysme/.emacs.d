;; -*- lexical-binding: t -*-

(straight-use-package 'vterm)

(add-hook 'vterm-mode-hook (lambda () (evil-emacs-state)))

;;(define-key vterm-mode-map (kbd "C-g") 'vterm--self-insert)

(global-set-key (kbd (if (display-graphic-p)  "C-4" "C-\\")) 'vterm-other-window)

(provide 'init-vterm)

