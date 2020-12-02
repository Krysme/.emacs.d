(defalias 'after-load 'with-eval-after-load)
(setq debug-on-error t)
(setq package-check-signature nil)

(defun load-directory (dir)
  (let ((load (lambda (f)
				(load-file (concat (file-name-as-directory dir) f)))))
	(mapc load (directory-files dir nil "\\.el$"))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(defun ensure-package (package)
  "ensure that PACKAGE is installed"
  (unless (package-installed-p package)
	(unless package-archive-contents
	  (package-refresh-contents))
	(package-install package))
  (require package))


(ensure-package 'dash)
