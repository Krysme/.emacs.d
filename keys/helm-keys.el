
(after-load 'helm
    (define-key helm-find-files-map [tab] 'helm-ff-RET)
    (define-key helm-find-files-map (kbd "TAB") 'helm-ff-RET))

(after-load 'helm
  (define-key helm-map [tab] 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "TAB") 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "C-e") 'helm-confirm-and-exit-minibuffer)
  (define-key helm-map (kbd "C-w") 'backward-kill-word)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line))

