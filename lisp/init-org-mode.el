(straight-use-package 'ob-rust)
(after-load 'org
        (require 'ob-js)
        (org-babel-do-load-languages
         'org-babel-load-languages
         '((js . t)
           (emacs-lisp . t))))

(provide 'init-org-mode)
