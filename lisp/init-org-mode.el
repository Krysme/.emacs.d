(straight-use-package 'ob-rust)
(straight-use-package 'rustic)
(after-load 'org
    (require 'ob-js)
    (org-babel-do-load-languages
	'org-babel-load-languages
	'((js . t)
	     (emacs-lisp . t)
	     (rust . t))))

(provide 'init-org-mode)
