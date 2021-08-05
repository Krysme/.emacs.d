;; -*- lexical-binding: t -*-
(defalias 'after-load 'with-eval-after-load)


;; bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use package integration
(straight-use-package 'use-package)
(use-package el-patch
  :straight t)

(setq gc-original-threashold gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 1024))

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold gc-original-threashold)))
(provide 'preload)
