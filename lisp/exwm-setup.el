
(defun terminal-open ()
  "startup a shell prompt"
  (interactive)
  (start-process "urxvt" nil "urxvt"))


(defun chrome ()
  (interactive)
  (start-process "chromium" nil "chromium"  "--no-sandbox"))

(defun firefox ()
  (interactive)
  (async-shell-command "firefox"))


(ensure-package 'exwm)
(ensure-package 'exwm-x)



(after-load 'exwm
  (shell-command "xrdb ~/.Xresources"))


(after-load 'exwm
  (global-set-key [f12] 'exwm-init))

(after-load 'exwm
  (define-key exwm-mode-map (kbd "C-x b") 'helm-buffers-list)
  (define-key exwm-mode-map [f4] 'terminal-open)
  (global-set-key [f4] 'terminal-open)
  (global-set-key [f8] 'chrome))


;; update title hook
(after-load 'exwm
  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-title))))


(defun reboot ()
  (interactive)
  (desktop-save-in-desktop-dir)
  (add-hook 'kill-emacs-hook (lambda () (async-shell-command "reboot")))
  (save-buffers-kill-emacs))

(defun poweroff ()
  (interactive)
  (desktop-save-in-desktop-dir)
  (add-hook 'kill-emacs-hook (lambda () (async-shell-command "poweroff")))
  (save-buffers-kill-emacs))

(defun logout ()
  (interactive)
  (desktop-save-in-desktop-dir)
  (setq kill-emacs-hook nil)
  (save-buffers-kill-emacs))

(provide 'exwm-setup)
