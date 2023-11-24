(defun eshell-clear-buffer ()
    "Clear terminal"
    (interactive)
    (let ((inhibit-read-only t))
	(erase-buffer)
	(eshell-send-input)))

(add-hook 'eshell-mode-hook
    (lambda ()
	(define-key evil-insert-state-map (kbd "C-d") 'eshell-life-is-too-much)
	(define-key evil-insert-state-map (kbd "C-l") 'eshell-clear-buffer)))
;; (eshell-previous-matching-input-from-input ARG)
(provide 'init-eshell)
