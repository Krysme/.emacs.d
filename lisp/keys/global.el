
(after-load 'helm
  (global-set-key  (kbd "M-x") #'helm-M-x)
  (global-set-key  (kbd "C-x C-f") 'helm-find-files))

(global-set-key (kbd "C-x k") 'kill-this-buffer)
