
;; space keys
(after-load 'evil
  (define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
  (define-key evil-insert-state-map (kbd "C-s") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC w o") 'delete-other-windows)
  (define-key evil-normal-state-map (kbd "SPC w q") 'save-buffers-kill-terminal)
  (define-key evil-normal-state-map (kbd "SPC k") 'kill-this-buffer)
  (define-key evil-normal-state-map (kbd "SPC i") 'indent-buffer)
  (define-key evil-normal-state-map (kbd "SPC h") 'help-command)

  ;; multi window operations
  (define-key evil-normal-state-map (kbd "SPC w v") 'evil-window-vsplit)
  (define-key evil-normal-state-map (kbd "SPC w s") 'evil-window-split)
  (define-key evil-normal-state-map (kbd "SPC w j") 'evil-window-split))
