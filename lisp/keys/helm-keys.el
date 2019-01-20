
(after-load 'helm
    (global-set-key  (kbd "M-x") #'helm-M-x)
    (global-set-key  (kbd "C-x C-f") 'helm-find-files)
    (define-key helm-find-files-map [tab] 'helm-ff-RET)
    (define-key helm-find-files-map (kbd "TAB") 'helm-ff-RET))

(after-load 'helm
  (define-key helm-map [tab] 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "TAB") 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "C-e") 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "C-w") 'backward-kill-word))

(after-load 'evil
  (after-load 'helm
    (define-key evil-normal-state-map (kbd "SPC c") 'helm-M-x)
    (define-key evil-normal-state-map (kbd "SPC f") 'helm-find-files)
    (define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)
    (define-key evil-insert-state-map (kbd "C-c") 'helm-M-x)))
