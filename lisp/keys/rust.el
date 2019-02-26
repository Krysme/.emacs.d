(after-load 'evil
  (after-load 'rust-mode
    (add-hook
     'rust-mode-hook
     (lambda ()
       (define-key evil-normal-state-map (kbd "SPC i") 'rust-format-buffer)))))
