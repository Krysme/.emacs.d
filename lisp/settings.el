(setq inhibit-startup-message t)


;;; get rid of the ring bell
(setq ring-bell-function 'ignore)

;; highlight current line
(global-hl-line-mode +1)


(global-prettify-symbols-mode 1)


(menu-bar-mode -1)
(tool-bar-mode -1)

(desktop-save-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(ensure-package 'smooth-scrolling)

(after-load 'smooth-scrolling
  (smooth-scrolling-mode 1))

(display-time-mode t)

(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(add-to-list 'default-frame-alist '(font . "Inconsolata-20"))




(global-display-line-numbers-mode t)

(provide 'settings)
