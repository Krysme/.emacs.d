
(require 'package)

(setq package-archives
      '(("melpa-stable" . "http://mirrors.163.com/elpa/melpa-stable/")
	("melpa" . "http://mirrors.163.com/elpa/melpa/")
	("gnu" . "http://mirrors.163.com/elpa/gnu/")))

(package-initialize)

(defun ensure-package (package)
  "ensure that PACKAGE is installed"
  (unless (package-installed-p package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install package))
  (require package))


(ensure-package 'dash)
