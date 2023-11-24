
(defun my-eshell-exit-or-delete-char (arg)
    "Exit Eshell if the command line is empty, otherwise delete the char."
    (interactive "p")
    (if (and (eolp) (eq (point) (es-window-end eshell-last-output-end t)))
	(eshell-life-is-too-much)
	(delete-char arg)))
(add-hook 'eshell-mode-hook (lambda () (local-set-key (kbd "C-d") 'my-eshell-exit-or-delete-char)))

(provide 'init-eshell)
