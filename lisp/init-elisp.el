;; -*- lexical-binding: t -*-

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'company-mode)


(add-hook 'paredit-mode-hook 'paredit-custom-leader-keys)


(after-load 'smartparens (sp-local-pair 'elisp-mode "'" nil 
					:actions nil))

(defun mark-outer-sexp ()
  (interactive)
  (call-interactively 'backward-up-list)
  (call-interactively 'evil-exit-visual-state)
  (call-interactively 'evil-jump-item)
  (call-interactively 'evil-visual-char)
  (call-interactively 'evil-jump-item))

(add-hook 'emacs-lisp-mode-hook
	  (evil-define-key 'insert emacs-lisp-mode-map (kbd "C-w") 'backward-kill-sexp)
	  (evil-define-key 'visual emacs-lisp-mode-map (kbd "v") 'mark-outer-sexp))

(provide 'init-elisp)
