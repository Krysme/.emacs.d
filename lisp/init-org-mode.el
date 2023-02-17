(after-load 'org
  (require 'ob-js)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((js . t)
     (emacs-lisp . nil))))

(provide 'init-org-mode)
