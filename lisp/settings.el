;; -*- lexical-binding: t -*-

(straight-use-package 'smooth-scrolling)

(straight-use-package 'all-the-icons)
(straight-use-package 'helpful)
(straight-use-package 'dashboard)
(straight-use-package 'json-mode)
(use-package dirvish :straight t :init (dirvish-override-dired-mode))


(straight-use-package 'solarized-theme)
(straight-use-package 'spacemacs-theme)
(straight-use-package 'doom-themes)

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

(setq doom-themes-enable-bold t doom-themes-enable-italic t)
(let* ((msystem (getenv "MSYSTEM"))
       (theme (if (string= "CLANG64" msystem)
                      'spacemacs-dark
                      'doom-one))
       (recentf-file (expand-file-name (format "recentf-%s" msystem) user-emacs-directory)))
      (load-theme theme t)
      (setq recentf-save-file recentf-file))

(load-theme 'doom-one t)
;; theme

;; font
(set-frame-font "JetBrains Mono 15" nil t)

(dolist (script '(han kana cjk-misc bopomofo))
  (set-fontset-font t script
                    (font-spec :family "Sarasa Mono J")
                    nil
                    'prepend))

(set-fontset-font t 'emoji (font-spec :family "Noto Color Emoji") nil 'append)



(font-family-list)
(when (member "NanumSquareRound" (font-family-list))
      (set-fontset-font t 'hangul (font-spec :family "NanumSquareRound")))

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
