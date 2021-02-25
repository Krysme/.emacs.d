
(after-load 'helm
  (global-set-key  (kbd "M-x") #'helm-M-x)
  (global-set-key  (kbd "C-x C-f") 'helm-find-files))

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-c") 'kill-emacs)
(global-set-key (kbd "M-c") nil)
(global-set-key (kbd "C-4") (lambda () (interactive) (vterm-other-window)))
(global-set-key (kbd "C-\\") (lambda () (interactive) (vterm-other-window)))
