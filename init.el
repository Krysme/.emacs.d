;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load straight
(require 'preload)

(require 'init-evil)
(require 'init-vertico)
(require 'init-elisp)
(require 'init-vterm)
(require 'init-magit)
(require 'init-paredit)
(require 'init-lsp)
(require 'init-company)
(require 'init-utils)
(require 'init-which-key)
(require 'init-yasnippet)
(require 'init-treemacs)
(require 'init-adoc)
(require 'settings)
(require 'init-rust)
(require 'init-c-cpp)
(require 'init-go)
(require 'init-racket)
(require 'init-markdown)
(require 'init-python)




(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


