;; misc
(after-load 'evil
  ;; use emacs quit key
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  
  ;; switching for Shift to Ctrl
  (define-key evil-normal-state-map (kbd "C-5") 'evil-jump-item)
  (define-key evil-normal-state-map (kbd "C-;") 'evil-goto-line)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-append-line))
