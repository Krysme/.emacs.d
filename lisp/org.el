
(ensure-package 'org-bullets)
(require 'org-tempo)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
