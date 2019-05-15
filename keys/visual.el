
(after-load 'evil
  (define-key evil-visual-state-map (kbd "C-j") 'evil-move-5-lines-down)
  (define-key evil-visual-state-map (kbd "C-k") 'evil-move-5-lines-up)
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-visual-state-map (kbd "SPC g") 'google-search)
  (define-key evil-motion-state-map (kbd "SPC g") 'google-search)
  )
