;; -*- lexical-binding: t -*-
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(straight-use-package 'expand-region)

(add-hook 'paredit-mode-hook 'paredit-custom-leader-keys)

(after-load 'smartparens (sp-local-pair 'elisp-mode "'" nil 
					:actions nil))


(setq evil-elisp-mark nil)
(add-hook 'evil-visual-state-exit-hook (lambda () (setq evil-elisp-mark nil)))

(defun mark-outer-sexp ()
  (interactive)
  (call-interactively 'backward-up-list)
  (call-interactively 'evil-exit-visual-state)
  (call-interactively 'evil-jump-item)
  (call-interactively 'evil-visual-char)
  (call-interactively 'evil-jump-item))

(defun emacs-lisp-sexp-key ()
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "v") 'er/expand-region))

(add-hook 'emacs-startup-hook 'emacs-lisp-sexp-key)

(provide 'init-elisp)
