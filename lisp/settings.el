(setq inhibit-startup-message t)


;;; get rid of the ring bell
(setq ring-bell-function 'ignore)

;; highlight current line
(global-hl-line-mode +1)
(global-linum-mode t)

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
;; sfdws_sdfassf
(add-to-list 'default-frame-alist '(font . "Source Code Pro-15"))

(load-theme 'spacemacs-dark t)


(provide 'settings)
