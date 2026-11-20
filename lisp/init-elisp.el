;; -*- lexical-binding: t -*-
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(straight-use-package 'aggressive-indent)

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

(provide 'init-elisp)
