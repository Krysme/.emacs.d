;; -*- lexical-binding: t -*-

(defalias 'after-load 'with-eval-after-load)
(setq debug-on-error t)

(defun load-directory (dir)
  (let ((load (lambda (f)
		(load-file (concat (file-name-as-directory dir) f)))))
    (mapc load (directory-files dir nil "\\.el$"))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-file (expand-file-name "package.el" user-emacs-directory)) 
(load-directory (expand-file-name "lisp" user-emacs-directory))
(load-directory (expand-file-name "keys" user-emacs-directory))









