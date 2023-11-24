(defun eshell-clear-buffer ()
    "Clear terminal"
    (interactive)
    (let ((inhibit-read-only t))
	(erase-buffer)
	(eshell-send-input)))

(add-hook 'eshell-mode-hook
    (lambda ()
	(company-mode -1)
	(setq completion-in-region-function #'consult-completion-in-region)
	(define-key evil-insert-state-map (kbd "C-d") 'eshell-life-is-too-much)
	(define-key evil-insert-state-map (kbd "C-l") 'eshell-clear-buffer)
	(define-key evil-insert-state-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
	(define-key evil-insert-state-map (kbd "C-n") 'eshell-next-matching-input-from-input)))

(provide 'init-eshell)
