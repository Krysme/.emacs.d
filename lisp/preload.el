;; -*- lexical-binding: t -*-
(defalias 'after-load 'with-eval-after-load)

(setq native-comp-async-report-warnings-errors nil)

;; bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el"
			  user-emacs-directory)) 
	 (bootstrap-version 5)) 
    (unless (file-exists-p bootstrap-file) 
	(with-current-buffer (url-retrieve-synchronously
				 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el" 'silent 'inhibit-cookies)

	    (goto-char (point-max))
	    (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

;; use package integration
(straight-use-package 'use-package)
(use-package el-patch :straight t)

(setq read-process-output-max (* 16 1024 1024))

(setq gc-cons-threshold (* 128 1024 1024))

(provide 'preload)
