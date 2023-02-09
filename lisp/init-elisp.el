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
  (progn 
    (call-interactively 'backward-up-list)
    (call-interactively 'evil-exit-visual-state)
    (call-interactively 'evil-jump-item)
    (call-interactively 'evil-visual-char)
    (call-interactively 'evil-jump-item)))


(defun my-expand-region ()
  (interactive)
  (when (= (-  (region-end) (region-beginning)) 1 )
    (call-interactively 'evil-exit-visual-state))
  (call-interactively 'er/expand-region))

(defun emacs-lisp-sexp-key ()
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "v") 'my-expand-region)
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "C-l") (lambda () (interactive) (backward-sexp -1)))
  (evil-define-key 'visual emacs-lisp-mode-map (kbd "C-h") 'backward-sexp)
  (evil-define-key 'insert emacs-lisp-mode-map (kbd "C-9") 'paredit-wrap-round-from-behind))

(add-hook 'emacs-startup-hook 'emacs-lisp-sexp-key)
 
(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (forward-sexp 1)
  (insert " "))

(provide 'init-elisp)
