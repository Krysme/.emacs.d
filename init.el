;; -*- lexical-binding: t -*-

(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defalias 'after-load 'with-eval-after-load)

(require 'package-setup)

(require 'evil-setup)
(require 'helm-setup)
(require 'settings)
(require 'paredit-setup)
(require 'racket-setup)
(require 'program-util)
(require 'which-key-setup)
(require 'desktop-setup) 
(require 'lsp-setup)





(defun load-directory (dir)
  (let ((load (lambda (f)
		(load-file (concat (file-name-as-directory dir) f)))))
    (mapc load (directory-files dir nil "\\.el$"))))

(load-directory (expand-file-name "keys" (expand-file-name "lisp" user-emacs-directory)))









