;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load straight
(require 'preload)

(require 'init-evil)
;(require 'init-selectrum)
(require 'init-vertico)
(require 'init-elisp)
(require 'init-paredit)
(require 'init-vterm)
(require 'init-c-cpp)
(require 'init-rust)
(require 'init-lsp)
(require 'init-magit)
(require 'init-company)
(require 'init-utils)
(require 'init-which-key)
(require 'init-yasnippet)
(require 'init-treemacs)
(require 'settings)




(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


