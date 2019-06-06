(setq inhibit-startup-message t)


;;; get rid of the ring bell
(setq ring-bell-function 'ignore)

;; highlight current line
(global-hl-line-mode +1)
(global-display-line-numbers-mode)

(global-prettify-symbols-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(setq make-backup-files nil)
(setq auto-save-default nil)

(ensure-package 'smooth-scrolling)

(after-load 'smooth-scrolling
  (smooth-scrolling-mode 1))

(display-time-mode t)

(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))


(setq tab-always-indent 'complete)

(add-hook 'after-change-major-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
(add-to-list 'default-frame-alist '(font . "Source Code Pro-15"))

(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

(unless (package-installed-p 'poet-theme)
  (package-install 'poet-theme))

(load-theme 'poet t)

(recentf-mode t)
(setq recentf-max-menu-items 1000)


(fset 'yes-or-no-p 'y-or-n-p)
