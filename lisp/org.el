
(ensure-package 'org-bullets)
(require 'org-tempo)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
							 (rust . t)))

(setq org-hide-emphasis-markers t)
