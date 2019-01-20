
(defun start-a-shell ()
  "startup a shell prompt"
  (interactive)
  (async-shell-command "urxvt"))


(defun chrome ()
  (interactive)
  (async-shell-command "chromium --no-sandbox"))

(defun firefox ()
  (interactive)
  (async-shell-command "firefox"))






(ensure-package 'exwm)
(ensure-package 'exwm-x)


(provide 'exwm)

;;(use-package exwm-config)
;; (use-package exwm-x)
(after-load 'exwm
  (exwm-init))

(after-load 'exwm-config
  (exwm-config-default))

(after-load 'exwm
  (shell-command "xrdb ~/.Xresources"))

(after-load 'exwm
  (define-key exwm-mode-map (kbd "C-x b") 'helm-buffers-list)
  (global-set-key [f4] 'start-a-shell)
  (global-set-key [f8] 'chrome))


;; update title hook
(after-load 'exwm
  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-title))))

(provide 'exwm-setup)
