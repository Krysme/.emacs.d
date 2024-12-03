;; -*- lexical-binding: t -*-



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defalias 'after-load 'with-eval-after-load)
(setenv "https_proxy" "http://127.0.0.1:8123")
(setenv "http_proxy" "http://127.0.0.1:8123")

(setq gc-cons-threshold (* 1024 1024 1024))
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 256 1024 1024))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load straight

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
;(require 'init-org-mode)
(require 'init-projectile)


;; languages
(require 'init-lsp)
(require 'init-c-cpp)
(require 'init-rust)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


