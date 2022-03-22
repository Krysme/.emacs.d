;; -*- lexical-binding: t -*-

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(straight-use-package 'elisp-format)

(define-key emacs-lisp-mode-map (kbd "C-c C-f") 'elisp-format-buffer)

(add-hook 'paredit-mode-hook 'paredit-custom-leader-keys)

(after-load 'smartparens (sp-local-pair 'elisp-mode "'" nil 
					:actions nil))


(provide 'init-elisp)
