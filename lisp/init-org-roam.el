(setq org-roam-directory (file-truename "~/code/roam"))
(straight-use-package 'org)
(straight-use-package 'org-roam)
(straight-use-package 'org-bullets) 
(setq org-agenda-files '("~/agenda.org"))


(add-hook 'org-mode-hook 'org-bullets-mode)
(org-roam-db-autosync-mode)
(provide 'init-org-roam)
