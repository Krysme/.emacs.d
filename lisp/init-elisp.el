;; -*- lexical-binding: t -*-
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(straight-use-package 'aggressive-indent)

(straight-use-package 'expand-region)

(use-package eros
  :ensure t
  :straight t
  :hook (emacs-lisp-mode . eros-mode)
  :hook (lisp-interaction-mode . eros-mode))


(after-load 'smartparens (sp-local-pair (list 'elisp-mode 'clojure-mode) "'" nil 
				        :actions nil))
(setq lisp-body-indent 8)
(setq-default indent-tabs-mode nil)
(put 'if 'lisp-indent-function 'defun)
(setq lisp-indent-offset nil)
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

(defun my-forward-sexp ()
       (interactive)
       (if (= (point) (region-beginning))
               (let* ((origin-point (point)))
                     (goto-char (region-end))
                     (backward-sexp -1)
                     (let ((end-point (point)))
	                  (set-mark origin-point)
	                  (goto-char end-point)))
               (backward-sexp -1)))



(defun check-selected-text ()
       "Obtains the selected text region in the editor as a string and checks if there is any space or line-break in it."
       (interactive)
       (if (string-match-p
            "[[:space:]\n]"
            (buffer-substring-no-properties
	     (region-beginning)
	     (region-end)))
               t
               nil))


(defun enter-after-sexp ()
       (interactive)
       (let* ((region-end-evil (region-end)))
             (call-interactively 'evil-insert)
             (goto-char (region-end))
             (call-interactively 'paredit-RET)))


(defun lisp-expand-til-multiple-sexp ()
       (interactive)
       (while (not (check-selected-text))
              (call-interactively 'my-expand-region)))

(defun emacs-lisp-sexp-key ()
       (evil-define-key 'visual paredit-mode-map (kbd "v") 'my-expand-region)
       (evil-define-key 'visual paredit-mode-map (kbd "V") 'lisp-expand-til-multiple-sexp)
       (evil-define-key 'visual paredit-mode-map (kbd "C-<return>") 'enter-after-sexp)
       (evil-define-key 'visual paredit-mode-map (kbd "C-l") 'my-forward-sexp)
       (evil-define-key 'visual paredit-mode-map (kbd "C-h") 'backward-sexp)
       (evil-define-key 'insert paredit-mode-map (kbd "C-9") 'paredit-wrap-round-from-behind))

(add-hook 'emacs-startup-hook 'emacs-lisp-sexp-key)

(defun paredit-wrap-round-from-behind ()
       (interactive)
       (forward-sexp -1)
       (paredit-wrap-round)
       (forward-sexp 1)
       (insert " "))

(provide 'init-elisp)
