
(defun terminal-open ()
  "startup a shell prompt"
  (interactive)
  (start-process "simple terminal" nil "st"))

(defun chrome ()
  (interactive)
  (start-process "chromium" nil "chromium"  "--no-sandbox"))

(defun firefox ()
  (interactive)
  (async-shell-command "firefox"))


(global-set-key [f4] 'terminal-open)
(global-set-key [f8] 'chrome)

;; update title hook
(after-load 'exwm
  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-title))))


(provide 'exwm-setup)
