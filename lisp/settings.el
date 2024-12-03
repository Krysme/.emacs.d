;; -*- lexical-binding: t -*-
(setq 
 native-comp-async-report-warnings-errors nil)
(use-package smooth-scrolling :ensure t)
(use-package doom-themes :ensure t)

(use-package all-the-icons :ensure t)
(use-package helpful :ensure t)
(use-package dashboard :ensure t)
(use-package json-mode :ensure t)
(use-package dirvish :ensure t)

(dashboard-setup-startup-hook)
(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(setq find-file-visit-truename t)

(global-hl-line-mode +1)

(global-display-line-numbers-mode)

(global-prettify-symbols-mode 0)
(global-auto-revert-mode 1)


(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8-unix)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq tab-always-indent 'complete)

(dirvish-override-dired-mode)


(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)



(after-load 'smooth-scrolling (smooth-scrolling-mode 1))

(display-time-mode t)

(load-theme 'doom-one t)
;; theme

;; font
(set-frame-font "JetBrains Mono 15" nil t)

(recentf-mode t)

(add-hook 'after-change-major-mode-hook (lambda () 
					  (modify-syntax-entry ?_ "w")))

(setq recentf-max-menu-items 1000)

(fset 'yes-or-no-p 'y-or-n-p)





(add-hook 'json-mode-hook 'smartparens-mode)

(global-set-key (kbd "C-w") 'backward-kill-word)
;; enable erase-buffer
(put 'erase-buffer 'disabled nil)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)


(provide 'settings)
