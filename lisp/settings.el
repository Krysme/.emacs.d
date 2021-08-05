;; -*- lexical-binding: t -*-
(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(global-hl-line-mode +1)

(global-display-line-numbers-mode)

(global-prettify-symbols-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq tab-always-indent 'complete)
(straight-use-package 'smooth-scrolling)

(after-load 'smooth-scrolling
  (smooth-scrolling-mode 1))

(display-time-mode t)

;; theme
(straight-use-package 'spacemacs-theme)
(load-theme 'spacemacs-dark t)

;; font
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Medium-12"))

(recentf-mode t)

(add-hook 'after-change-major-mode-hook (lambda () (modify-syntax-entry ?_ "w")))

(setq recentf-max-menu-items 1000)

(fset 'yes-or-no-p 'y-or-n-p)


(use-package helpful
  :ensure t
  :straight t)




(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'settings)
