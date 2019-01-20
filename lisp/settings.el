(setq inhibit-startup-message t)


;;; get rid of the ring bell
(setq ring-bell-function 'ignore)



(global-prettify-symbols-mode 1)


(menu-bar-mode -1)
(tool-bar-mode -1)

(desktop-save-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(ensure-package 'smooth-scrolling)

(after-load 'smooth-scrolling
  (smooth-scrolling-mode 1))


(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)





(global-display-line-numbers-mode t)

(provide 'settings)
