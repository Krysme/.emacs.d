(straight-use-package 'org)
(straight-use-package 'org-roam)
(straight-use-package 'org-bullets) 



(straight-use-package 'calfw)
(straight-use-package 'calfw-org)
(require 'calfw)
(require 'calfw-org)

(add-hook 'org-mode-hook 'org-bullets-mode)
(org-roam-db-autosync-mode)
(provide 'init-org-roam)
