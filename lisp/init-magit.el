(straight-use-package 'magit)
(straight-use-package 'evil-magit)

(after-load 'evil 
  (define-key evil-normal-state-map (kbd "SPC m g") 'magit))

(provide 'init-magit)
