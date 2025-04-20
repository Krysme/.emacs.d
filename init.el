;; -*- lexical-binding: t -*-

(setq gc-cons-threshold (* 1024 1024 1024))
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 256 1024 1024))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load straight
(require 'preload)

(require 'init-eshell)
(require 'init-company)
(require 'init-paredit)
(require 'init-evil)
(require 'init-vertico)
(require 'init-elisp)
(require 'init-git)
(require 'init-utils)
(require 'init-which-key)
(require 'init-yasnippet)
(require 'init-treemacs)
(require 'settings)
(require 'init-markdown)
(require 'init-org-mode)
(require 'init-projectile)
(require 'init-nix)


;; languages
(require 'init-lsp)
(require 'init-python)
;; (require 'init-clojure)
(require 'init-c-cpp)
(require 'init-haskell)
(require 'init-rust)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


