(straight-use-package 'magit)
(straight-use-package 'evil-magit)

(after-load 'evil 
  (define-key evil-normal-state-map (kbd "<leader>mg") 'magit))

(provide 'init-magit)
