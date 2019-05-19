;; -*- lexical-binding: t -*-

(ensure-package 'idris-mode)

(add-hook 'idris-mode-hook 'smartparens-mode)
(add-hook 'idris-repl-mode-hook 'smartparens-mode)

