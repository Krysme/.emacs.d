
(defun terminal-open ()
  "startup a shell prompt"
  (interactive)
  (start-process "simple terminal" nil "st"))

(defun chrome ()
  (interactive)
  (start-process "chromium" nil "chromium"  "--no-sandbox"))

(defun browser ()
  (interactive)
  (start-process "qutebrowser" nil "qutebrowser"))

(defun screen-shot ()
  "perform a screenshot with scrot -s"
  (interactive)
  (start-process "screen shot" nil "scrot" "-s"))

(defun htop ()
  "start htop"
  (interactive)
  (start-process "simple terminal" nil "st" "-e" "htop"))

(defun dmenu-run ()
  "run a program"
  (interactive)
  (start-process "dmenu_run" nil "dmenu_run"))


(global-set-key (kbd "C-4") 'terminal-open)
(global-set-key (kbd "C-8") 'browser)
(global-set-key (kbd "M-p") 'dmenu-run)
(global-set-key (kbd "C-0") 'screen-shot)

;; update title hook
(after-load 'exwm
  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-title))))


(provide 'program-util)
