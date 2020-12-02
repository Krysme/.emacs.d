(after-load 'evil-collection
  (define-key evil-normal-state-map (kbd "SPC m g") 'magit)
  (define-key evil-normal-state-map (kbd "SPC m p") 'magit-dispatch-popup))
