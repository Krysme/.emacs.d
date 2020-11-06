;; -*- lexical-binding: t -*-


(setq gc-cons-threshold 100000000000000)
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 8000000)))

(load-file (expand-file-name "preload.el" user-emacs-directory)) 
(load-directory (expand-file-name "lisp" user-emacs-directory))
(load-directory (expand-file-name "keys" user-emacs-directory))









