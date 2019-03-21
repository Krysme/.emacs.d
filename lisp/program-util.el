
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

(defun htop ()
  "start htop"
  (interactive)
  (start-process "simple terminal" nil "st" "-e" "htop"))


(global-set-key (kbd "C-4") 'terminal-open)
(global-set-key (kbd "C-8") 'firefox)

;; update title hook
(after-load 'exwm
  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-title))))


(provide 'program-util)
