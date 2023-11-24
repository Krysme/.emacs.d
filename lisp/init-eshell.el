(defun eshell-clear-buffer ()
    "Clear terminal"
    (interactive)
    (let ((inhibit-read-only t))
	(erase-buffer)
	(eshell-send-input)))

(add-hook 'eshell-mode-hook
    (lambda ()
	(company-mode -1)
	(setq completion-in-region-function #'consult-completion-in-region)))

(after-load 'evil 
    (evil-define-key 'insert eshell-mode-map (kbd "C-d") 'eshell-life-is-too-much)
    (evil-define-key 'insert eshell-mode-map (kbd "C-l") 'eshell-clear-buffer)
    (evil-define-key 'insert eshell-mode-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
    (evil-define-key 'insert eshell-mode-map (kbd "C-n") 'eshell-next-matching-input-from-input))

(global-set-key (kbd "C-4") 'eshell)

(provide 'init-eshell)
