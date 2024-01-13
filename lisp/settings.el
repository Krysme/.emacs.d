;; -*- lexical-binding: t -*-
(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(setq find-file-visit-truename t)

(global-hl-line-mode +1)

(global-display-line-numbers-mode)

(global-prettify-symbols-mode 0)
(global-auto-revert-mode 1)


(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq tab-always-indent 'complete)
(straight-use-package 'smooth-scrolling)

(straight-use-package 'atom-one-dark-theme)

(straight-use-package 'all-the-icons
    :if (display-graphic-p))

(after-load 'smooth-scrolling (smooth-scrolling-mode 1))

(display-time-mode t)

(load-theme 'atom-one-dark t)
;; theme
(straight-use-package 'all-the-icons)

;; font
(set-frame-font "JetBrains Mono 15" nil t)

(recentf-mode t)

(add-hook 'after-change-major-mode-hook (lambda () 
					  (modify-syntax-entry ?_ "w")))

(setq recentf-max-menu-items 1000)

(fset 'yes-or-no-p 'y-or-n-p)


(use-package helpful
    :ensure t
    :straight t)

(use-package dashboard
  :ensure t
  :straight t
  :config (dashboard-setup-startup-hook))

(use-package json-mode
  :ensure t
  :straight t)

(add-hook 'json-mode-hook 'smartparens-mode)

(global-set-key (kbd "C-w") 'backward-kill-word)
;; enable erase-buffer
(put 'erase-buffer 'disabled nil)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)


(provide 'settings)
