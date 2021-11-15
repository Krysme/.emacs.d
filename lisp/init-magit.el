(straight-use-package 'magit)
(straight-use-package 'evil-magit)

(after-load 'evil 
  (define-key evil-normal-state-map (kbd "SPC mg") 'magit))

(provide 'init-magit)
