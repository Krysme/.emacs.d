;; -*- lexical-binding: t -*-

(setq gc-original-threashold gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 1024))
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold gc-original-threashold)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load straight
(require 'preload)
(require 'init-env-settings)

(require 'init-evil)
(require 'init-vertico)
(require 'init-elisp)
(require 'init-vterm)
(require 'init-git)
(require 'init-paredit)
(require 'init-company)
(require 'init-utils)
(require 'init-which-key)
(require 'init-yasnippet)
(require 'init-treemacs)
(require 'init-adoc)
(require 'settings)
(require 'init-markdown)
(require 'init-org-mode)


;; languages
(require 'init-lsp)
(require 'init-python)
(require 'init-clojure)
(require 'init-typescript)
(require 'init-c-cpp)
(require 'init-rust)
(require 'init-go)
(require 'init-racket)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


