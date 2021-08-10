;; -*- lexical-binding: t -*-

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'company-mode)


(add-hook 'paredit-mode-hook 'paredit-custom-leader-keys)

(after-load 'smartparens
  (sp-local-pair 'elisp-mode "'" nil :actions nil))


(provide 'init-elisp)
