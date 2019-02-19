
(require 'package)

(setq package-archives
      '(("melpa-stable" . "http://mirrors.163.com/elpa/melpa-stable/")
	("melpa" . "http://mirrors.163.com/elpa/melpa/")
	("gnu" . "http://mirrors.163.com/elpa/gnu/")))

(package-initialize)

(defun ensure-package (package)
  "ensure that PACKAGE is installed"
  (unless (or (package-installed-p package)
	       (not (y-or-n-p (message "Package %s is missing, install it ?" package))))
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install package))
  (require package))


(ensure-package 'dash)

(provide 'package-setup)
